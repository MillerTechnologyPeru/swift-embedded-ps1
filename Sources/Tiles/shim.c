// Tiles/shim.c — PSn00bSDK tile-map example, C code verbatim.
// Ported from examples/graphics/tilesasm/main.c.
// (only changes: main() renamed tiles_main(), POSIX stubs + heap init added)

#include <sys/types.h>
#include <stdlib.h>
#include <psxetc.h>
#include <psxgte.h>
#include <psxgpu.h>
#include <psxapi.h>
#include <psxpad.h>
#include <psxsio.h>

// ---------------------------------------------------------------------------
// POSIX stubs for libswiftEmbeddedPlatformPOSIX
// ---------------------------------------------------------------------------

extern void *malloc(size_t size);
extern void  free(void *ptr);

int posix_memalign(void **memptr, size_t alignment, size_t size) {
	void *p = malloc(size);
	if (!p) return 12; // ENOMEM
	*memptr = p;
	return 0;
}

void arc4random_buf(void *buf, size_t nbytes) {
	static uint32_t state = 0xDEADBEEF;
	uint8_t *p = (uint8_t *)buf;
	for (size_t i = 0; i < nbytes; i++) {
		state = state * 1664525u + 1013904223u;
		p[i] = (uint8_t)(state >> 24);
	}
}

int  putchar(int c) { AddSIO(c); return c; }
void exit(int code) { (void)code; while (1) {} }

uintptr_t __stack_chk_guard = 0xDEADC0DE;
void __stack_chk_fail(void) { while (1) {} }

// ---------------------------------------------------------------------------
// Heap init  (PSn00bSDK malloc needs InitHeap before use)
// ---------------------------------------------------------------------------

extern char _end;

static void init_heap(void) {
	unsigned int start = (unsigned int)&_end;
	int size = (int)(0x801E0000u - start);
	InitHeap((void *)start, size);
}

/*
 * Constants for convenience
 */
#define OT_LEN		4		/* Number of ordering table entries */
#define PKTBUFF_LEN	32768	/* Size of packet buffer (in bytes) */

/* Define display/draw environments for double buffering */
DISPENV disp[2];
DRAWENV draw[2];
int db;

/* Define the ordering table and packet buffer arrays */
long ot[2][OT_LEN];
char pkt[2][PKTBUFF_LEN];

/* Next packet pointer for primitive generation */
char *pkt_addr;

/* Pad data buffer */
char pad_buff[2][34];

/*
 * Tile definition structure (to define VRAM coordinates of tiles)
 */
typedef struct _TILEDEF
{
	u_char	u,v;		// Texture coordinates of tile
	u_short	clut;		// CLUT number of tile
	u_short	pad;		// Padding
	u_short	tpage;		// Texture page number
} TILEDEF;

/*
 * Tile info structure (for drawing function)
 */
typedef struct _TILEINFO
{
	RECT	window;		// Drawing window of tile info (only cull, not clip)
	TILEDEF	*tiles;		// Pointer to TILEDEF array
	u_short	*mapdata;	// Pointer to 16-bit map data
	u_short	map_w;		// Tile map dimensions
	u_short	map_h;
} TILEINFO;

/* Define array of tiledefs */
TILEDEF tiles[256];

/*
 * Declarations for tim.S
 */
extern u_long tim_tileset[];

/*
 * Declarations for drawtiles.s
 */
extern u_char *DrawTiles(int scroll_x, int scroll_y,
	TILEINFO *info, long *ot, u_char *pri);

/*
 * Init function
 */
void init(void)
{
	TIM_IMAGE tim;

	int i,tx,ty;

	// This not only resets the GPU but it also installs the library's
	// ISR subsystem to the kernel
	ResetGraph(0);

	// Define display environments, first on top and second on bottom
	SetDefDispEnv(&disp[0], 0, 0, 320, 240);
	SetDefDispEnv(&disp[1], 0, 240, 320, 240);

	// Define drawing environments, first on bottom and second on top
	SetDefDrawEnv(&draw[0], 0, 240, 320, 240);
	SetDefDrawEnv(&draw[1], 0, 0, 320, 240);

	// Set and enable clear color
	setRGB0(&draw[0], 0, 96, 0);
	setRGB0(&draw[1], 0, 96, 0);
	draw[0].isbg = 1;
	draw[1].isbg = 1;

	// Setup buffer counter, packet pointer and ordering tables
	db = 0;
	pkt_addr = pkt[db];

	// Clear ordering tables
	ClearOTagR(ot[0], OT_LEN);
	ClearOTagR(ot[1], OT_LEN);

	// Load test font
	FntLoad(960, 0);

	// Open up a test font text stream of 100 characters
	FntOpen(0, 8, 320, 224, 0, 100);

	// Upload tileset TIM
	GetTimInfo((u_long*)tim_tileset, &tim);	/* Get TIM parameters */
	LoadImage(tim.prect, tim.paddr);		/* Upload texture to VRAM */
	if( tim.mode & 0x8 )					/* Upload CLUT if present */
		LoadImage(tim.crect, tim.caddr);

	// Initialize tiledefs with coords to the tileset TIM
	i = 0;
	for(ty=0; ty<16; ty++)
	{
		for(tx=0; tx<16; tx++)
		{
			tiles[i].u = tx<<4;
			tiles[i].v = ty<<4;
			tiles[i].tpage = getTPage(tim.mode & 3, 0,
				tim.prect->x, tim.prect->y);
			tiles[i].clut = getClut(tim.crect->x, tim.crect->y);
			i++;
		}
	}

	// Initialize pads
	InitPAD(&pad_buff[0][0], 34, &pad_buff[1][0], 34);
	StartPAD();
	ChangeClearPAD(0);

} /* init */

/*
 * Display function
 */
void display(void)
{
	// Wait for all drawing to complete
	DrawSync(0);

	// Wait for vertical sync to cap the logic to 60fps (or 50 in PAL mode)
	// and avoid screen tearing
	VSync(0);

	// Switch pages
	PutDispEnv(&disp[db]);
	PutDrawEnv(&draw[db]);

	// Begin drawing of the ordering table
	DrawOTag(ot[db]+(OT_LEN-1));

	// Toggle buffer index
	db = !db;

	// Clear next ordering table array
	ClearOTagR(ot[db], OT_LEN);

	// Reset packet pointer
	pkt_addr = pkt[db];

	// Enable display output, ResetGraph() disables it by default
	SetDispMask(1);

} /* display */

/*
 * Initializes a randomly generated tile map
 */
void initdata(u_short *tiledata, int w, int h)
{
	int tx,ty;

	for(ty=0; ty<h; ty++)
	{
		srand(200+ty);
		for(tx=0; tx<w; tx++)
		{
			*tiledata = rand() & 0xFF;
			tiledata++;
		}
	}

} /* initdata */

/*
 * Simple line sorting function
 */
void sortLine(int x1, int y1, int x2, int y2, long *ot)
{
	LINE_F2 *line_pkt;

	line_pkt = (LINE_F2*)pkt_addr;
	setLineF2(line_pkt);
	setXY2(line_pkt, x1, y1, x2, y2);
	setRGB0(line_pkt, 255, 255, 255);
	addPrim(ot, line_pkt);
	line_pkt++;

	pkt_addr = (char*)line_pkt;

} /* sortLine */

/*
 * Simple box sorting function
 */
void sortBox(RECT *rect)
{
	sortLine(rect->x, rect->y,
		rect->x, rect->y+rect->h,
		ot[db]);
	sortLine(rect->x+rect->w, rect->y,
		rect->x+rect->w, rect->y+rect->h,
		ot[db]);
	sortLine(rect->x, rect->y,
		rect->x+rect->w, rect->y,
		ot[db]);
	sortLine(rect->x, rect->y+rect->h,
		rect->x+rect->w, rect->y+rect->h, ot[db]);

} /* sortBox */

/*
 * Sorts a draw area primitive for hardware clipping
 */
void sortDrawEnv(RECT *drawarea)
{
	DR_AREA *drawpkt;

	drawpkt = (DR_AREA*)pkt_addr;
	setDrawArea(drawpkt, drawarea);
	addPrim(ot[db], drawpkt);
	pkt_addr += sizeof(DR_AREA);

} /* sortDrawEnv */

/* 
 * Swift-accessible API
 * -------------------
 * Globals shared between C functions and Swift
 */
static int scroll_x, scroll_y;
static TILEINFO tileinfo;
static u_short *tiledata;

/*
 * tiles_init_all() — heap init, GPU init, load TIM, init tiledefs,
 *                    malloc tilemap buffer, generate random map
 */
void tiles_init_all(void) {
	/* Init malloc heap */
	init_heap();

	/* Init stuff */
	init();

	/* Allocate buffer for tile data */
	tiledata = (u_short*)malloc((256*256)<<1);

	/* Generate a random tilemap of values 0-255 */
	initdata(tiledata, 256, 256);

	/* Define the TILEINFO struct */
	tileinfo.window.x = 0;
	tileinfo.window.y = 0;
	tileinfo.window.w = 320;
	tileinfo.window.h = 240;
	tileinfo.tiles = tiles;
	tileinfo.mapdata = tiledata;
	tileinfo.map_w = 256;
	tileinfo.map_h = 256;

	/* Initialize scroll */
	scroll_x = 0;
	scroll_y = 0;
}

/*
 * tiles_handle_input() — read pad, update scroll & window
 */
void tiles_handle_input(void) {
	PADTYPE *pad = (PADTYPE*)&pad_buff[0][0];
	int i;

	if( pad->stat == 0 )
	{
		if( ( pad->type == 0x4 ) ||
			( pad->type == 0x5 ) ||
			( pad->type == 0x7 ) )
		{
			if( !(pad->btn&PAD_L1) )	/* Window resize */
			{
				if( !(pad->btn&PAD_UP) && ( tileinfo.window.y > 0 ) )
				{
					tileinfo.window.y--;
				}
				i = tileinfo.window.y+tileinfo.window.h;
				if( !(pad->btn&PAD_DOWN) && ( i < disp[db].disp.h ) )
				{
					tileinfo.window.y++;
				}
				if( !(pad->btn&PAD_LEFT) && ( tileinfo.window.x > 0 ) )
				{
					tileinfo.window.x--;
				}
				i = tileinfo.window.x+tileinfo.window.w;
				if( !(pad->btn&PAD_RIGHT) && ( i < disp[db].disp.w ) )
				{
					tileinfo.window.x++;
				}
			}
			else if( !(pad->btn&PAD_L2) )	/* Window move */
			{
				if( !(pad->btn&PAD_UP) && ( tileinfo.window.h > 0 ) )
				{
					tileinfo.window.h--;
				}
				i = tileinfo.window.y+tileinfo.window.h;
				if( !(pad->btn&PAD_DOWN) && ( i < disp[db].disp.h ) )
				{
					tileinfo.window.h++;
				}
				if( !(pad->btn&PAD_LEFT) && ( tileinfo.window.w > 0 ) )
				{
					tileinfo.window.w--;
				}
				i = tileinfo.window.y+tileinfo.window.h;
				if( !(pad->btn&PAD_RIGHT) && ( i < disp[db].disp.w ) )
				{
					tileinfo.window.w++;
				}
			}
			else							/* Scrolling */
			{
				if( !(pad->btn&PAD_UP) )
				{
					scroll_y-=2;
				}
				if( !(pad->btn&PAD_DOWN) )
				{
					scroll_y+=2;
				}
				if( !(pad->btn&PAD_LEFT) )
				{
					scroll_x-=2;
				}
				if( !(pad->btn&PAD_RIGHT) )
				{
					scroll_x+=2;
				}
			}
		}
	}
}

/*
 * tiles_sort_frame() — sort box, clip, DrawTiles, tile window clip
 */
void tiles_sort_frame(void) {
	RECT cliprect;

	/* Draw a box around the tile-map window */
	sortBox(&tileinfo.window);

	/* Sort default clipping (this is processed last) */
	sortDrawEnv(&draw[db].clip);

	/* Sort the tiles */
	pkt_addr = DrawTiles(scroll_x, scroll_y,
		&tileinfo, ot[db], pkt_addr);

	/* Sort clipping to the tile window */
	cliprect = tileinfo.window;
	cliprect.y += draw[db].clip.y;
	sortDrawEnv(&cliprect);
}

/*
 * tiles_print_stats() — render scroll position & window info
 */
void tiles_print_stats(void) {
	FntPrint(-1, "X=%d Y=%d\n", scroll_x, scroll_y);
	FntPrint(-1, "WINDOW POS. (%d,%d)\n",
		tileinfo.window.x, tileinfo.window.y);
	FntPrint(-1, "WINDOW SIZE (%d,%d)\n",
		tileinfo.window.w, tileinfo.window.h);
	FntFlush(-1);
}

/*
 * tiles_display() — double-buffer flip (wrapper for display())
 */
void tiles_display(void) {
	display();
}
