
#define MINIMAP_FLAG_XENO (1<<0)
#define MINIMAP_FLAG_USCM (1<<1)
#define MINIMAP_FLAG_PMC (1<<2)
#define MINIMAP_FLAG_UPP (1<<3)
#define MINIMAP_FLAG_CLF (1<<4)
#define MINIMAP_FLAG_YAUTJA (1<<5)
#define MINIMAP_FLAG_XENO_CORRUPTED (1<<6)
#define MINIMAP_FLAG_XENO_ALPHA (1<<7)
#define MINIMAP_FLAG_XENO_BRAVO (1<<8)
#define MINIMAP_FLAG_XENO_CHARLIE (1<<9)
#define MINIMAP_FLAG_XENO_DELTA (1<<10)
#define MINIMAP_FLAG_XENO_FERAL (1<<11)
#define MINIMAP_FLAG_XENO_TAMED (1<<12)
#define MINIMAP_FLAG_XENO_MUTATED (1<<13)
#define MINIMAP_FLAG_XENO_FORSAKEN (1<<14)
#define MINIMAP_FLAG_XENO_RENEGADE (1<<15)
#define MINIMAP_FLAG_ALL (1<<16) - 1

///The minimap zoom scale
#define MINIMAP_SCALE 2
#define MINIMAP_PIXEL_FROM_WORLD(val) (val * MINIMAP_SCALE - 3)

//The actual size of a users screen in pixels
#define SCREEN_PIXEL_SIZE 480
///The actual size of the minimap in pixels
#define MINIMAP_PIXEL_SIZE 512

GLOBAL_LIST_INIT(all_minimap_flags, bitfield2list(MINIMAP_FLAG_ALL))

//Turf colors
#define MINIMAP_SOLID "#ebe5e5ee"
#define MINIMAP_DOOR "#451e5eb8"
#define MINIMAP_FENCE "#8d2294ad"
#define MINIMAP_ROAD "#a1a1a1"
#define MINIMAP_LAVA "#db4206ad"
#define MINIMAP_DIRT "#9c906dc2"
#define MINIMAP_SNOW "#c4e3e9c7"
#define MINIMAP_MARS_DIRT "#aa5f44cc"
#define MINIMAP_ICE "#93cae0b0"
#define MINIMAP_WATER "#94b0d59c"

//Area colors
#define MINIMAP_AREA_ENGI "#c19504e7"
#define MINIMAP_AREA_ENGI_CAVE "#5a4501e7"
#define MINIMAP_AREA_MEDBAY "#3dbf75ee"
#define MINIMAP_AREA_MEDBAY_CAVE "#17472cee"
#define MINIMAP_AREA_SEC "#a22d2dee"
#define MINIMAP_AREA_SEC_CAVE "#421313ee"
#define MINIMAP_AREA_RESEARCH "#812da2ee"
#define MINIMAP_AREA_RESEARCH_CAVE "#2d1342ee"
#define MINIMAP_AREA_COMMAND "#2d3fa2ee"
#define MINIMAP_AREA_COMMAND_CAVE "#132242ee"
#define MINIMAP_AREA_CAVES "#3f3c3cef"
#define MINIMAP_AREA_JUNGLE "#2b5b2bee"
#define MINIMAP_AREA_COLONY "#6c6767d8"
#define MINIMAP_AREA_LZ "#ebe5e5e3"
#define MINIMAP_AREA_CONTESTED_ZONE "#0603c4ee"

#define MINIMAP_SQUAD_UNKNOWN "#d8d8d8"
#define MINIMAP_SQUAD_ALPHA "#4148c8"
#define MINIMAP_SQUAD_BRAVO "#fbc70e"
#define MINIMAP_SQUAD_CHARLIE "#76418a"
#define MINIMAP_SQUAD_DELTA "#0c0cae"
#define MINIMAP_SQUAD_ECHO "#00b043"
#define MINIMAP_SQUAD_FOXTROT "#fe7b2e"
#define MINIMAP_SQUAD_SOF "#400000"
#define MINIMAP_SQUAD_INTEL "#053818"
#define MINIMAP_SQUAD_UPP "#B22222"
#define MINIMAP_SQUAD_PMC "#ccffe9"

#define MINIMAP_ICON_BACKGROUND_CIVILIAN "#7D4820"
#define MINIMAP_ICON_BACKGROUND_CIC "#3f3f3f"
#define MINIMAP_ICON_BACKGROUND_USCM "#888888"
#define MINIMAP_ICON_BACKGROUND_XENO "#3a064d"

#define MINIMAP_ICON_COLOR_COMMANDER "#c6fcfc"
#define MINIMAP_ICON_COLOR_HEAD "#F0C542"
#define MINIMAP_ICON_COLOR_BRONZE "#eb9545"

#define MINIMAP_ICON_COLOR_DOCTOR "#b83737"


//Prison
#define MINIMAP_AREA_CELL_MAX "#570101ee"
#define MINIMAP_AREA_CELL_HIGH "#a54b01ee"
#define MINIMAP_AREA_CELL_MED "#997102e7"
#define MINIMAP_AREA_CELL_LOW "#5a9201ee"
#define MINIMAP_AREA_CELL_VIP "#00857aee"
#define MINIMAP_AREA_SHIP "#885a04e7"

#define TACMAP_BASE_OCCLUDED "Occluded"
#define TACMAP_BASE_OPEN "Open"
