-- Note: for modding, avoid overwriting this file - instead overwrite individual
-- keys from another lua file using the format NDefines.NCamera.FOV = 50

NDefines = {

	NCamera = {
		FOV							= 35, -- Field-of-View

		ENTITY_SPRITE_DESIGN_ENTRY_CAM_DIR = 	{ -1.0, -0.6, 0.3 },
		ENTITY_SPRITE_DESIGN_ENTRY_CAM_LOOK_AT = { -2, -1.5, -1.0 },	-- x=closer  , -y = up  , +z = left -z = right
		ENTITY_SPRITE_DESIGN_ENTRY_ZOOM_SCALE = 2.1,

		ENTITY_SPRITE_SHIP_SECTION_CAM_DIR = 	{ -1.0, -0.9, 0.7 },
		ENTITY_SPRITE_SHIP_SECTION_CAM_LOOK_AT = { 0, 0, 0 },
		ENTITY_SPRITE_SHIP_SECTION_ZOOM_SCALE = 2.3,

		ENTITY_SPRITE_SYSTEM_VIEW_CAM_DIR = 	{ -1.0, -0.5, 0.3 },
		ENTITY_SPRITE_SYSTEM_VIEW_CAM_LOOK_AT = { 0, 0, 0 },
		ENTITY_SPRITE_SYSTEM_VIEW_ZOOM_SCALE = 1.6,

		ENTITY_SPRITE_CUSTOMIZE_SPECIES_VIEW_CAM_DIR = 	{ -1.0, -0.5, 0.3 },
		ENTITY_SPRITE_CUSTOMIZE_SPECIES_VIEW_CAM_LOOK_AT = { 0, 0, 0 },
		ENTITY_SPRITE_CUSTOMIZE_SPECIES_VIEW_ZOOM_SCALE = 1.7,
		
		ENTITY_SPRITE_FRONTEND_BG_CAM_DIR = 	{ 0.0, 0.0, 1.0 },
		ENTITY_SPRITE_FRONTEND_BG_CAM_LOOK_AT = { 0.0, 0, 0 },
		ENTITY_SPRITE_FRONTEND_BG_ZOOM_SCALE = 10.0,

		GALAXY_SHOW_FLEETS_ZOOM 		= 2300, -- Camera zoom interval to show fleet icons
		GALAXY_SHOW_STARNAME_ZOOM 		= 800, -- Camera zoom interval to show star name
		GALAXY_SHOW_FILTERICONS_ZOOM 	= 300, -- Camera zoom interval to show filter icons

		SHOW_FLEETS_ZOOM 			= 300, -- Show fleet icons instead of ship icons above this height
		HIDE_ORBITS_ZOOM 			= 0,

		ZOOM_STEPS_GALAXY 			  = { 100, 200, 400, 600, 900, 1500, 3000 }, 	-- Galaxy zoom steps
		-- ZOOM_STEPS_SYSTEM_PERCENTAGES = { 0.01, 0.05, 0.25, 0.5, 1.0, 1.5, 3.0 }, -- System zoom steps, in percent relative to the system size
		ZOOM_STEPS_SYSTEM_PERCENTAGES = { 0.025, 0.1, 0.25, 0.5, 1.0, 1.5, 3.0 }, -- System zoom steps, in percent relative to the system size
		ZOOM_STEPS_SHOW_FLEET_HEALTH_BARS 		= { 3, 4, 5, 6 }, -- on which zoom steps per-fleet health bars should be shown
		LEAVE_SYSTEM_BIAS			= 15000.0, -- Leave system if we are 10 distance from step
		LEAVE_GALAXY_BIAS			= 55.0, -- Leave galaxy if we are 10 distance from step

		LEAVE_SYSTEM_ZOOM_STEP 			= 1, -- Controls which zoom step is used after leaving system
		ENTER_SYSTEM_ZOOM_STEP 			= 6, -- Controls which zoom step is used after entering system
		SYSTEM_FOCUS_PLANET_STEP 		= 2, -- Controls which zoom step to planet zoom to in a system
		FOCUS_PLANET_DBLCLICK_X_OFFSET 	= 10.0,

		SYSTEM_SPACE_SCALE_MULT 	= 10.0,
		GALAXY_SPACE_SCALE_MULT 	= 2.0,

		SYSTEM_HOVER_RANGE 			= 0.005,

		DEFAULT_ACCELERATION 		= 0.8,
		FOCUS_ACCELERATION 			= 1.6,

		VELOCITY_FACTOR				= 0.13,
		VELOCITY_FACTOR_TRANSITION	= 0.06,

		BORDER_NAMES_FADEOUT_ZOOM	= 600,
		BORDER_NAMES_FADEOUT_SPEED	= 4.0,
		BORDER_FLAG_FADEOUT_ZOOM	= 600,
		BORDER_FLAG_FADEOUT_SPEED	= 4.0,
		NEBULA_NAMES_FADEOUT_ZOOM	= 250,
		NEBULA_NAMES_FADEOUT_SPEED	= 1.5,

		PARTICLE_GALAXY_TRANSITION_OFFSET	= 30.0,
		PARTICLE_SYSTEM_TRANSITION_OFFSET	= 20.0,

		EDGE_SCROLLING_PIXELS					= 3,	-- how many pixels from window edge that will trigger edge scrolling
		SCROLL_SPEED							= 0.035, 	-- higher values = faster camera. NOTE that this is tweakables from settings as well!
		SYSTEM_CAMERA_RESTRICT_EXTRA_SPACE 		= 100.0,-- how far the camera can go outside a systems outer radius

		SYSTEM_MIN_PITCH						= 20.0,	-- in degrees
		SYSTEM_MAX_PITCH						= 80.0,	-- in degrees
		GALAXY_MIN_PITCH						= 30.0,	-- in degrees
		GALAXY_MAX_PITCH						= 85.0,	-- in degrees
		FOCUSED_MIN_PITCH						= -80.0, -- in degrees, used when focused on planet/ship
		FOCUSED_MAX_PITCH						= 80.0, -- in degrees, used when focused on planet/ship
		FOCUSED_MIN_ZOOM_BASE					= 20.0, -- base min zoom
		FOCUSED_MIN_ZOOM_MULT					= 0.5, -- min zoom is base + entity radius * FOCUSED_MIN_ZOOM_MULT
		FOCUSED_PLANET_MIN_ZOOM_MULT			= 1.6,
		FOCUSED_ZOOM_RATE						= 0.2, -- higher values means faster zoom in/out
		FOCUS_START_ZOOM_STEP					= 4, 	-- which zoom step will be used when focusing on a new object

		ROTATION_RADIANS_PER_MOUSE_UNIT			= 0.004, -- moving the mouse 1 pixel results in rotation of X radians * sensitivity from settings
		MOUSE_MOVEMENT_TO_START_ROTATION_SQ		= 16,	 -- how far (squared) you need to move the mouse before the game recognizes this as a camera rotation action

		OFFSET_ANOMALY_VIEW					= 50,	-- how far from the right the anomaly view will pop up when toggling in galaxy view

		SYSTEM_SLIDE_RADIUS_FACTOR = 4.0,
		SYSTEM_SLIDE_SPEED = 100.0,
	},

	NGraphics = {
		CAMERA_DISTANCE_TO_ZOOM				= 10.0,
		
		DEAD_SHIP_DRAG						= 15.0,	-- When ships die, reduce their speed with x / second
	
		ORBIT_HSV							= { 0.44, 0.8, 0.6 },
		SYSTEM_INNER_BORDER_HSV				= { 0.0, 0.0, 1.0 },
		SYSTEM_OUTER_BORDER_HSV				= { 0.1, 0.8, 0.9 },


		SYSTEM_LINE_ALPHA_FADE_STEP			= { 1, 6 },			-- Fade alpha betweeen zoom step X and Y
		SYSTEM_LINE_ALPHA_FADE_VALUE		= { 0.1, 0.05 },		-- Fade alpha value between X and Y

		DEFAULT_PLANET_PLANE				= -150.0,
		MOON_SCALE 							= 0.7,
		PLANET_SCALE_SYSTEM 				= { 0.425, 0.325, 0.35, 0.5, 0.5, 0.5, 0.75 }, -- Scale for each System zoom steps
		--										0  1  2  3    4   5   6		7
		RELATION_COLOR_PLAYER_HSV			= { 0.67, 0.8, 0.35 },
		RELATION_COLOR_ALLIED_HSV			= { 0.8, 0.35, 0.4 },
		RELATION_COLOR_NEUTRAL_HSV			= { 0.0, 0.0, 0.22 },
		RELATION_COLOR_HOSTILE_HSV			= { 0.0, 0.3 , 0.3 },
		RELATION_COLOR_SELECTED_RGB			= { 1.5, 1.1, 0.0},

		ASTEROID_PLANE						= -100.0,
		ASTEROID_POSITION_OFFSET 			= 8.0,
		ASTEROID_HEIGHT_OFFSET 				= 4.0,
		ASTEROID_DIST_POW					= 3,
		ASTEROID_AMOUNT_RADIUS_SCALER 		= 0.1,
		ASTEROID_MAX_SCALE 					= 4.0,
		ASTEROID_ROTATION_SPEED				= .3035,

		GALAXY_STAR_ICON_SCALE				= 1.5,
		GALAXY_STAR_ICON_MAX_SCALE 			= 1.25,
		GALAXY_DUST_SIZE 					= 25.0,
		GALAXY_DUST_SIZE_EXTRA 				= 35.0,
		GALAXY_DUST_ROTATION_SPEED			= 0.005,
		GALAXY_NEBULA_DUST_SIZE 			= 10.0,
		GALAXY_NEBULA_DUST_SIZE_EXTRA 		= 25.0,
		GALAXY_NEBULA_DUST_ROTATION_SPEED	= 0.002,

		SHIP_ZOOM_SCALE_MULT				= 200.0,

		PLANET_TILT_FROM_SUN				= 0.52, -- Tilt away from sun
		PLANET_RING_TILT_FROM_SUN			= -0.16,
		PLANET_MAP_ICON_OFFSET				= 0.6,	-- based on planet size

		TRAILS_ALPHA_FADE					= 0.5, -- Controls of quick we alpha fade-out
		TRAILS_MISSILE_ALPHA_FADE			= 6, -- Controls of quick we alpha fade-out missile trails
		TRAILS_BASE_WIDTH					= 1.0, -- Trails width
		TRAILS_MISSILE_BASE_WIDTH			= 3.0, -- Missile trails width
		TRAILS_LOCATOR_NAME					= "exhaust",
		STRIKE_CRAFT_TRAIL_FADE_RATE		= 1.0,
		STRIKE_CRAFT_HEIGHT_OFFSET			= 30.0,
		STRIKE_CRAFT_HEIGHT_RANDOM			= 5.0,

		BORDER_TEXTURE_SIZE					= 512, -- size of borders data texture. larger = slower with more sample points. Too small and it will be inaccurate, too big and the super sampling won't have much effect
		BORDER_MIN_SIZE_FOR_SYMBOL			= 2, -- To show a symbol the border blob must be able to fit a square of x pixels

		BORDER_COUNTRY_FILL_TEXTURE			= "gfx/map/hexgrid.dds",	-- texture to use on the inside
		BORDER_COUNTRY_EDGE_TEXTURE			= "gfx/map/edge.dds", 		-- texture to use for the edge triangle strip
		BORDER_FALLEN_EMPIRE_FILL_TEXTURE	= "gfx/map/fallen_empire_border_fill.dds",	-- texture to use on the inside
		BORDER_FALLEN_EMPIRE_EDGE_TEXTURE	= "gfx/map/fallen_empire_border_edge.dds", 	-- texture to use for the edge triangle strip
		BORDER_CONFLICTED_FILL_TEXTURE		= "gfx/map/conflicted_border_fill.dds",	-- texture to use for the inside of conflicted systems.
		BORDER_CONFLICTED_EDGE_TEXTURE		= "gfx/map/conflicted_border_edge.dds",	-- texture to use for the edge of conflicted systems.

		STAR_PIN_CIRCLE_RADIUS				= 2.0,	-- The lines that go from solar systems down to the 0-plane. This is the radius of that circle
		STAR_PIN_CIRCLE_NUM_POINTS			= 6,	-- how many points in the circle on the 0-plane
		STAR_PIN_ENABLE_NEUTRAL				= true, -- Should the game draw pins for stars that are not within any borders?
		STAR_PIN_NEUTRAL_COLOR				= { 0.5, 0.5, 0.5, 0.5 },	-- The color for pins that are not inside any borders

		BORDER_FLAG_SCALE					= 0.6,
		MAPNAME_BORDER_SCALE				= 1.0,
		MAPNAME_BORDER_MIN_SIZE				= 100,
		MAPNAME_BORDER_OFFSET_MUL			= 0.75,
		MAPNAME_BORDER_OFFSET_ADD			= 4.0,
		MAPNAME_NEBULA_SCALE				= 0.8,
		MAPNAME_SECTOR_SCALE				= 3,

		NULL_ENTITY	= "test_object_entity",
		NULL_INSTANT_PROJECTILE = "default_instant_projectile",
		NULL_MISSILE_PROJECTILE = "default_missile_projectile",

		SCIENCE_SHIP_SURVEY_ENTITY = "survey_base_effect_entity",
		SCIENCE_SHIP_SURVEY_ENTITY_LOCATOR = "",
		SCIENCE_SHIP_SURVEY_ENTITY_MAX_SCALE_FACTOR = 1.0, -- Scale in xy can max be scale z * SCIENCE_SHIP_SURVEY_ENTITY_MAX_SCALE_FACTOR. Scale z will be equal to the distance between surveyed object and ship
		STATION_CONSTRUCTION_ENTITY_NUM_STATES = 0,	-- states should be named "progress_X" where X is a multiple of 100 / STATION_CONSTRUCTION_ENTITY_NUM_STATES. i.e progress_0, progress_20, progress_40 etc ( if define is 5 )

		CONSTRUCTION_SHIP_TERRAFORMING_BEAM_ENTITY = "terraforming_effect_entity",
		CONSTRUCTION_SHIP_TERRAFORMING_PLANET_ENTITY = "terraforming_planet_effect_entity",
		CONSTRUCTION_SHIP_TERRAFORMING_BEAM_ENTITY_SCALE_XY = 1.0, -- Scale xy in local coords between ship and planet.
		CONSTRUCTION_SHIP_TERRAFORMING_BEAM_ENTITY_SCALE_Z = 0.62, -- Scale beam tip z in local coords so beam hits planet surface.
		CONSTRUCTION_SHIP_TERRAFORMING_PLANET_ENTITY_SCALE_R = 3.0, -- Scale radius r of the cloud surrounding the planet.

		-- NAVIGATION_ARROW_X values might require a game restart to push changes
		NAVIGATION_ARROW_ENTITY	= "navigation_arrow_entity",
		NAVIGATION_ARROW_OFFSET = 150.0,	-- offsets the arrow towards the edge
		NAVIGATION_ARROW_FONT = "Orbitron",
		NAVIGATION_ARROW_FONT_SPECIAL = "arial", -- russian and polish
		NAVIGATION_ARROW_TEXT_OFFSET = -50.0,
		NAVIGATION_ARROW_TEXT_SCALE = 1.6,
		NAVIGATION_ARROW_FONT_SIZE = 32,
		NAVIGATION_ARROW_TEXT_KERNING = 8,

		SHIP_HEALTH_BAR_COLOR 		= { 0.0, 1.0, 0.0, 1.0 },
		SHIP_HEALTH_BAR_BG_COLOR 	= { 0.5, 0.0, 0.0, 1.0 },
		SHIP_SHIELD_BAR_COLOR 		= { 0.0, 0.4, 1.0, 1.0 },
		SHIP_SHIELD_BAR_BG_COLOR 	= { 0.0, 0.0, 0.5, 1.0 },

		SHIP_TURRET_PROJECTILE_SPAWN_LOCATOR = "turret_muzzle_01",
		STRIKE_CRAFT_PROJECTILE_SPAWN_LOCATOR = "projectile_spawn",
		SHIP_TARGET_LOCATOR = "target_locator_",

		MISSILE_HEIGHT_OFFSET		= 10.0,	-- how high up missiles will fly
		MISSILE_ROTATION_RATE		= 17.0, -- how fast missiles will adjust their rotation. High values can cause visible snaps each micro update

		MISSILE_RANDOM_OFFSET_MIN_RADIUS = 5.0,		-- random spread of missiles
		MISSILE_RANDOM_OFFSET_MAX_RADIUS = 10.0,

		BALLISTIC_PROJECTILE_MISSED_LIFETIME = 2.0, -- missed ballistic projectiles will live for (at least) this long before being removed
		PROJECTILE_ENTITY_STOP_STATE = "stop", -- state that gets played on missile-, projectile- and on_hit entities when its time to stop

		SHIELD_EFFECT_TIME_SCALE = 1.5, -- how fast the shield effects are animated
		SHIELD_EFFECT_LOOP_INTERVAL = 0.5, -- when to loop animation. value is in percent
		SHIELD_DISTANCE_FROM_SHIP = { 2.0, 0.0, 5.0 }, -- how far "out" from the ships shields will extend. left-right, upd-down, front-back
		SHIELD_DISTANCE_FROM_SHIP_MULT = { 1.15, 1.15, 1.15 }, -- how far "out" from the ships shields will extend. based on ship's size. left-right, upd-down, front-back

		SHIELD_EFFECT_ENTITIES = {
			"small_shield_impact_entity",
			"medium_shield_impact_entity",
			"large_shield_impact_entity",
		},
		SHIELD_EFFECT_LOOPING_ENTITIES = {
			"small_shield_impact_looping_entity",
			"medium_shield_impact_looping_entity",
			"large_shield_impact_looping_entity",
		},

		MISSED_BEAM_LENGTH = 1500.0, -- how long missed beams will be

		SHIP_DAMAGE_TEXTURE = "gfx/models/ships/other/damaged_noise.dds",
		SHIP_DISSOLVE_NOISE_TEXTURE = "gfx/models/ships/other/dissolve_noise.dds",
		SHIP_RANDOM_HEIGHT_OFFSET = 15.0,

		RANDOM_HEIGHT_MIN = -20.0,
		RANDOM_HEIGHT_MAX = 20.0,

		MOVE_ARROW_SYSTEM_CONTROL_POINT_SPACING = 100.0, -- When plotting the movement arrows, how far apart should the control points be?
		MOVE_ARROW_GALAXY_CONTROL_POINT_SPACING = 5.0, -- When plotting the movement arrows, how far apart should the control points be?
		MOVE_ARROW_SYSTEM_TARGET_ENTITY = "move_indicator_entity", -- Entity that is used at the end of the arrow
		MOVE_ARROW_GALAXY_TARGET_ENTITY = "galaxy_move_indicator_entity", -- Entity that is used at the end of the arrow
		ATTACK_ARROW_SYSTEM_TARGET_ENTITY = "attack_indicator_entity", -- Entity that is used at the end of the arrow
		ATTACK_ARROW_GALAXY_TARGET_ENTITY = "galaxy_attack_indicator_entity", -- Entity that is used at the end of the arrow
		TASK_ARROW_SYSTEM_TARGET_ENTITY = "task_indicator_entity", -- Entity that is used at the end of the arrow
		TASK_ARROW_GALAXY_TARGET_ENTITY = "galaxy_task_indicator_entity", -- Entity that is used at the end of the arrow

		GUI_PLANET_RING_DIR = { 1.5, -0.25, 1.5 },	-- direction of the ring for planets in gui icons
		TI_TEXTURE_GROW_AMOUNT = 1,	-- amount to grow TI for graphics

		--REPAIR_FLEET_EFFECT_ENTITY = "ship_repair_entity",
		--UPGRADE_FLEET_EFFECT_ENTITY = "ship_upgrade_entity",
		--ORBIT_FLEET_EFFECT_ENTITY = "ship_orbit_entity",
		--IDLE_FLEET_EFFECT_ENTITY = "",

		FLEET_EFFECT_ENTITIES = {
			"ship_repair_entity",		-- when repairing
			"ship_upgrade_entity",		-- when upgrading
			"ship_orbit_entity",		-- when orbiting
			""							-- when idling
		},
		FLEET_EFFECT_ENTITIES_BILLBOARD = {
			1,	-- when repairing
			1,	-- when upgrading
			0,	-- when orbiting
			1	-- when idling
		},
		FLEET_EFFECT_ENTITIES_SCALE = {
			0,	-- when repairing
			0,	-- when upgrading
			1,	-- when orbiting
			0	-- when idling
		},

		FTL_WINDUP_ENTITY_WARP = "warp_ftl_ship_effect_entity",
		FTL_WINDUP_ENTITY_HYPERLANE = "hyperlane_ftl_ship_effect_entity",
		FTL_WINDUP_ENTITY_JUMPDRIVE = "hyperlane_ftl_ship_effect_entity",

		ALIENFX_DEFAULT_COLOR = { 0.43, 0.8, 0.61 },
		
		RUINED_BUILDING = "gfx/interface/icons/buildings/building_destroyed.dds",
		
		AURA_EFFECT_COLOR_ALLIED_FRIENDLY 	= { 0.35, 1, 1, 0.05 },
		AURA_EFFECT_COLOR_ALLIED_HOSTILE 	= { 0.58, 1, 1, 0.05 }, 
		AURA_EFFECT_COLOR_ENEMY_FRIENDLY 	= { 0.1, 1, 1.0, 0.05  },
		AURA_EFFECT_COLOR_ENEMY_HOSTILE 	= { 0.00, 1, 0.3, 0.1 },
		
		MAX_GFX_PROJECTILES = 100,
		MAX_GFX_MISSILES = 50,
		MUZZLE_FLASH_LIMIT = 50,
		MUZZLE_FLASH_DURATION = 2.0,
		
		MAP_MODE_NEUTRAL_COLOR = { 0.5, 0.5, 0.5, 0.75 }
	},

	NInterface = {
		TOOLTIP_TIME 					= 0.05,
		TOOLTIP_DELAYED_TIME 			= 0.8,
		TOOLTIP_POSITION_OFFSET 		= { 21, 24 },
		TOOLTIP_POSITION_OFFSET_STAR 	= { 6.4, 0 },
		COUNTRY_ICONS = 23,

		FLEET_VIEW_RESERVE_ABOVE = 230,
		FLEET_VIEW_RESERVE_INSIDE = 134,

		NOTIFICATION_MESSAGE_XPOS 				= 130,	-- X-position where notification message starts
		NOTIFICATION_MESSAGE_YPOS 				= 44,	-- Y-position where notification message stops
		NOTIFICATION_MESSAGE_CLOSE_WARNING_PERC = 0.30,	-- Percentage of time left before auto close
		NOTIFICATION_MESSAGE_SPACING			= -10,
		NOTIFICATION_MESSAGE_MARGIN_RIGHT		= 80,
		NOTIFICATION_MESSAGE_SPEED				= 120.0,

		TECH_VIEW_ZOOM_STEPS					= { 1.0, 0.75, 0.5, 0.3 },
		TECH_VIEW_CAMERA_SPEED					= 6.0,
		TECH_VIEW_CAMERA_EDGE_SPEED				= 3000.0,

		PLANETVIEW_ORBITAL_RED_HEALTH 			= 50, -- How high percentage health before orbital health bar turns red in planet view.
		PLANETVIEW_ORBITAL_YELLOW_HEALTH 		= 75, -- How high percentage health before orbital health bar turns yellow in planet view.
		PLANETVIEW_DETACH_POP_DISTANCE			= 20, -- How far the pop has to be dragged before actually detaching from a tile

		GROWING_POP_ALPHA						= 0.60, -- Used in planet view surface tab
		QUEUED_BUILDING_ALPHA					= 0.60, -- Used in planet view surface tab
		POTENTIAL_ARMY_ALPHA					= 0.45, -- Used in planet view army tab

		ANOMALY_VIEW_RISK_LOW					= 0.1,	-- Color green if < 11%
		ANOMALY_VIEW_RISK_MEDIUM				= 0.49,	-- Color yellow if < 50%, else red

		BUILDINGS_TO_SHOW_CITY_LEVEL 			= { 1, 3, 5, 8, 11 }, -- Decides how many buildings are required to show the next level of city-infrastructure in city_frame

		TRADE_VIEW_SMALL_CREDIT_CHANGE			= 10,	-- Decides how much value is changed while holding control when increasing/decreasing credit in trade
		TRADE_VIEW_LARGE_CREDIT_CHANGE			= 100,	-- Decides how much value is changed while holding shift when increasing/decreasing credit in trade
		TRADE_VIEW_WIDE_MODE_THRESHHOLD			= 1470, -- Shows Trade View in wide mode if game resolution is above this
		SHIP_NAME_CAP_LENGTH					= 175,	-- Fleet name max width to limit Henrik Eklund's imagination
		SHIP_NAME_SIZE_MAX						= 26,	-- Max number of letters in ship names
		SPECIES_NAME_SIZE_MAX					= 20,   -- Max number of letters in army names
		SPECIES_NAME_CAP_LENGTH					= 175,   -- Max name width for army names
		EMPIRE_NAME_CAP_LENGTH					= 280, 	-- Width, based on galaxy view entry name for empires

		ADVISOR_DEFAULT_SHOW_SOUND				= "advisor_generic_phrase",
		ADVISOR_DEFAULT_CLICK_SOUND				= "advisor_clicking_respons_01",
		ADVISOR_ANNOYED_COUNT					= 5,
		ADVISOR_ANNOYED_SOUNDS					= { "advisor_clicking_respons_05", "advisor_clicking_respons_06", "advisor_clicking_respons_07", "advisor_clicking_respons_08", "advisor_clicking_respons_09", "advisor_clicking_respons_10", "advisor_clicking_respons_11", "advisor_clicking_respons_12", "advisor_clicking_respons_13", "advisor_clicking_respons_14", "advisor_clicking_respons_15", "advisor_clicking_respons_16" },
		POP_FACTION_HEADER_SPRITE_TYPE_DEFAULT	= "GFX_faction_header_blue",

		OUTLINER_PING_TIME 						= 2.40,	-- Amount of seconds to show the ping when having selected an object from the outliner
		
		FRONTEND_ANIMATED_BG_ENTITY				= "frontend_background_entity",
		FRONTEND_ANIMATED_BG_ASPECT_RATIO		= 1.777,

		MAX_NUM_SAVE_GAMES						= 30,
		
		DANGEROUS_FACTIONS_WHITE 				= 0.3, -- How much support a faction must have to be listed as a white dangerous faction.
		DANGEROUS_FACTIONS_YELLOW				= 0.5, -- How much support a faction must have to be listed as a yellow dangerous faction.
		DANGEROUS_FACTIONS_RED					= 0.8, -- How much support a faction must have to be listed as a red dangerous faction.
		
		SITUATION_LOG_DEBRIS_PICTURE_SPRITE		= "GFX_situation_log_debris_picture",
		SITUATION_LOG_DEBRIS_ICON_FILENAME		= "gfx/interface/icons/situation_log/situation_log_debris.dds",
		SITUATION_LOG_MODIFICATION_PICTURE_SPRITE 	= "GFX_situation_log_modification_picture",
		SITUATION_LOG_MODIFICATION_ICON_FILENAME 	= "gfx/interface/icons/situation_log/situation_log_modification.dds", 

		MIN_GUI_SCALE							= 0.5, -- Minimum UI scale factor
		BROWSER_BASE_URL						= "http://www.stellariswiki.com/",
		
		TOPBAR_BUTTONS_SHORTCUTS				= { "contacts", "F2", "situation", "F3", "technology", "F4", "empire", "F5", "leaders", "F6", "factions", "F7", "policies", "F8", "expansion_planner", "F9", "ship_designer", "F10"},	-- Shortcuts for topbar buttons
		TOPBAR_BUTTONS_PRIORITY					= { "contacts", "situation", "technology", "empire", "leaders", "factions", "strategic_resource", "species", "policies", "expansion_planner", "ship_designer" },	-- The order of topbar buttons
		TOPBAR_BUTTONS							= 4,	-- Amount of topbar buttons shown
	},

	NGameplay = {
		ALLOW_EMPIRE_DESIGN_CHEATS = false,
		VICTORY_CONDITION_DOMINATION = 0.4,
		VICTORY_CONDITION_FEDERATION = 0.6,
		
		FALLEN_EMPIRE_RESOURCE_STORAGE_MULT = 10,
		FALLEN_EMPIRE_REPEATABLE_TECHS = 5,
		
		MIN_HABITABILITY = 0.40,		-- Planet habitability must be at least this value to be able to colonize
		
		ABANDONED_EMPIRE_FLAG = "special/abandoned.dds",
		PRE_COMMUNICATIONS_EMPIRE_FLAG = "special/unknown.dds",
		FLEET_MIN_TI_CLEAR_RADIUS = 10,			-- min radius for clearing terra incognita, will use the highest of this and sensor range
		TI_TEXTURE_SIZE = 256,					-- size of the internal terra incognita texture, high resolutions can cause stuttering and will increase memory demand and save file size.
		START_YEAR = 2200,
		MIN_ANOMALIES = -1,
		MAX_ANOMALIES = 1,
		SYSTEM_INNER_RADIUS_OFFSET = 30,
		SYSTEM_MIN_INNER_RADIUS = 150,
		SYSTEM_OUTER_RADIUS_OFFSET = 100,
		SHIP_SUBLIGHT_SPEED_MULT = 5, 				-- General speed multiplier for ship movement within solar systems
		MISSILE_SUBLIGHT_SPEED_MULT = 5, 			-- General speed multiplier for ship movement within solar systems

		FTL_MIN_DIST = 1, 							-- Min distance to FTL point to start the FTL
		
		BORDERING_DISTANCE = 50,				-- Within this distance, we're considered to be neighbours	
		RELEVANT_DISTANCE = 100,				-- Within this distance, we're considered to be diplomatically relevant

		CONSTRUCTION_SHIP_WORK_SPEED_MULT = 1,	-- Construction ship construction speed multiplier
		OUTPOST_STATION_BUILD_SPEED_MULT = 0.3,	-- Applied when building outpost stations
		CONSTRUCTION_SHIP_STATION_OFFSET = 5,		-- distance to the station that the ship is building
		SCIENCE_SHIP_SPECIAL_PROJECT_OFFSET = 20,	-- distance to the special project when collecting data
		SCIENCE_SHIP_WORK_SPEED_MULT = 1.75,		-- Science ship survey speed multiplier

		SENSOR_KNOWLEDGE_HIGH_DIST_PERC = 0.30,		-- See planet classes if distance is 30% of total sensor range sq distance
		NEBULA_TRAVEL_SPEED_PENALTY = 0.30, 		-- 30% travel speed penalty

		HYPERLANE_GEN_REMOVE_PERC = 0.20,			-- Try to remove 20% of the longest edges
		HYPERLANE_GEN_REMOVED_MAX_DIST = 30, 		-- Don't remove an edge if you have to travel more than 30 stars to reach the same position
		HYPERLANE_GEN_REMOVE_TOO_MANY_EDGES = 4,	-- Remove edges if having 4 or more edges
		WORMHOLE_OPEN_SPEED = 1.3,					-- Wormhole opening speed. Wormhole capacity is incremented with this every micro update
		WORMHOLES_PER_STATION = 1,					-- How many wormholes a station can open at a time
		WORMHOLE_BASE_CAPACITY_REQUIREMENT = 200,		-- Required wormhole capacity for a jump is base(this one!) + fleet size
		WORMHOLE_CAPREQ_OUTSIDE_BORDERS = 0.3,		-- Percentage malus when opening wormholes to systems outside owner borders 
		FTL_TRAIL_DAYS = 360,						-- FLT Trail lifetime in days
 
		NORMAL_TAX_LEVEL 		= 0.25,				-- Tax level without happiness penalty
		PLANET_ORBIT_DISTANCE 	= 10.0,				-- how far from the planet ships will orbit
		PLANET_STATION_ORBIT_DISTANCE = 6.0,		-- how far from the planet orbital stations will be

		BASE_MONTHLY_INFLUENCE 		= 3,				-- Base Influence gained per month
		BASE_MONTHLY_MINERALS 		= 0,				-- Base Minerals gained per month
		BASE_MONTHLY_PHYSICS 		= 5,				-- Base Physics gained per month
		BASE_MONTHLY_SOCIETY 		= 5,				-- Base Society gained per month
		BASE_MONTHLY_ENGINEERING 	= 5,			-- Base Engineering gained per month
		BASE_MONTHLY_ENERGY 		= 0,				-- Base Energy gained per month

		BASE_SURVEY_TIME 		= 20.0,				-- Base Time In Days for surveying a planet

		PIRATE_TARGET_DIST 		= 80.0,				-- Target system can't be further away from home system

		FTL_RANGE_WARP 			= 45,				-- Base warp range
		FTL_RANGE_WORMHOLE 		= 65,				-- Wormhole range
		FTL_RANGE_JUMPDRIVE		= 100,				-- Jumpdrive range

		LEADER_POOL_SIZE		= 3,				-- Each leader pool will consist of this many leaders
		LEADER_POOL_LEAD_TIME	= 10,				-- Years leaders will remain in the leader pool until replaced
		LEADER_HIRING_COST 		= 50,
		LEADER_BASE_CAP			= 10,
		LEADER_EXPERIENCE_INIT_RAND_MOD 	= 0.35,
		LEADER_EXPERIENCE_INIT_ADD 			= 0.25,
		LEADER_SKILL_CAP		= 5,
		LEADER_SKILL_MIN		= 1,
		LEADER_EXP_MIN			= 200,
		LEADER_EXP_MAX			= 400,
		LEADER_AGE_HEIR_MIN		= 18,				-- Min age of generated heirs in dynastic governments
		LEADER_AGE_HEIR_MAX		= 24,				-- Max age of generated heirs in dynastic governments
		LEADER_AGE_MIN			= 28,				-- Min age of generated leaders
		LEADER_AGE_MAX			= 50,				-- Max age of generated leaders
		LEADER_SKILL_LEVEL_START	= 1,			-- Skill Level Leaders start with. XP needed { 200 475 825 1250 }
		LEADER_EXPERIENCE_REQUIREMENT_BASE_VALUE					= 125, -- Base value when calculating required experience for next skill level
		LEADER_EXPERIENCE_REQUIREMENT_SCALE_VALUE					= 75, -- Scale factor when calculating required experience for next skill level

		LEADER_ADMIRAL_FLEET_COMBAT_BASE_EXPERIENCE					= 10, -- Leader Admiral base experience from fleet combat
		LEADER_ADMIRAL_FLEET_COMBAT_EXPERIENCE_SCALE				= 0.4, -- Scale factor used when calculating experience gain for Admiral
		LEADER_ADMIRAL_FLEET_COMBAT_SHIPS_KILLED_CONVERSION			= 0.25, -- Scale factor for total number of ships killed after combat when calculating experience gain for Admiral
		LEADER_ADMIRAL_FLEET_COMBAT_SHIPS_LOST_CONVERSION			= 0.1, -- Scale factor for total number of ships lost after combat when calculating experience gain for Admiral

		LEADER_GENERAL_GROUND_COMBAT_BASE_EXPERIENCE				= 10, -- Leader General base experience from ground combat
		LEADER_GENERAL_GROUND_COMBAT_EXPERIENCE_SCALE				= 0.4, -- Scale factor used when calculating experience gain for General
		LEADER_GENERAL_GROUND_COMBAT_ARMIES_KILLED_CONVERSION		= 0.25, -- Scale factor for total number of armies killed after combat when calculating experience gain for General
		LEADER_GENERAL_GROUND_COMBAT_ARMIES_LOST_CONVERSION			= 0.1, -- Scale factor for total number of armies lost after combat when calculating experience gain for General

		LEADER_SCIENTIST_LEADING_RESEARCH_FIELD_EXPERIENCE			= 3.5,
		LEADER_SCIENTIST_SURVEY_EXPERIENCE							= 10, 	-- Experience gained from surveyed planet
		LEADER_SCIENTIST_SUCCESSFUL_ANOMALY_RESEARCH_EXPERIENCE		= 100, 	-- Experience gained from a successful discovery research
		LEADER_SCIENTIST_COMPLETED_SPECIAL_PROJECT_EXPERIENCE		= 100,	-- Experience gained from completing a special project
		LEADER_SCIENTIST_DEEP_SCAN_EXPERIENCE						= 200,	-- Experience gained from a deep scan
		LEADER_SCIENTIST_ASSIST_RESEARCH							= 0.35, 	-- Experience gained from assisting research per day
		LEADER_SCIENTIST_ASSIST_RESEARCH_MULT						= 0.125,	-- Assist Research modifier-mult per skill level (this value times skill level equals modifier)

		LEADER_GOVERNOR_BUILDING_OR_TILE_CLEAR_EXPERIENCE			= 0.5, -- Scale-value for each completed building-construction or tile-clear, multiplied with the resources spent
		LEADER_GOVERNOR_EDICT_GAIN_EXPERIENCE						= 0.05, -- Scale-value for the exp-gain given each month an Edict is active on the planet, multiplied with the resources spent
		LEADER_GOVERNOR_POP_IS_BORN_EXPERIENCE						= 8, -- Exp-gain for each Pop born
		LEADER_GOVERNOR_SECTOR_MONTHLY_EXPERIENCE					= 3.5,	-- Monthy exp from governing sector.

		LEADER_AGE_DEATH_CHANCE_AGE	= 72,			-- Before this age the chance wont increase
		LEADER_AGE_DEATH_CHANCE_INC = 0.01,			-- Increase with these % for each year above CHANCE_AGE

		GENERAL_DAMAGE_EXP_MULT		= 1.0,				-- Multiplier of how much damage translates into experience.
		GENERAL_DEFENSE_EXP_MULT	= 1.0,				-- Multiplier of how much defense translates into experience.

		HABITABILITY_IDEAL_PLANET		= 1.00,			-- Habitability of Gaia worlds
		HABITABILITY_WRONG_PLANET		= 0.7,			-- At which point we color habitability icons and text yellow
		HABITABILITY_OPPOSITE_PLANET	= 0.4,			-- At which point we color habitability icons and text red

		BORDER_BASE_RADIUS				= 15,		-- The base radius of the border
		BORDER_NEW_COLONY_START			= 0.25,		-- Newly started colony's borders is modified by this, goes up to 1x with progress
		BORDER_POPULATION_MODIFIER		= 0.15,		-- The border population modifier
		
		PLANETARY_BUILDING_ADD_FACTOR 	= 20,		-- Used in the calculation of the planetary building progress
		ORBITAL_BUILDING_DIV_FACTOR		= 6,		-- Used in the calculation of the orbital building progress

		-- War-score from fleet-battles = WAR_SCORE_SHIP_KILL_MUL * (WAR_SCORE_FLEET_COMBAT_WIN_BASE + ((loser_fleet_value_lost / loser_fleet_value_total) * (1 - ((winner_fleet_value_lost * WAR_SCORE_SHIP_KILL_WINNER_MUL) / winner_fleet_value_total))))
		WAR_SCORE_BLOCKADE_MUL				= 0.25,		-- Percentage warscore gained from having planets blockaded instead of occupied.
		WAR_SCORE_SHIP_KILL_MUL 			= 0.25,		-- Multiplier of warscore gained
		WAR_SCORE_SHIP_KILL_WINNER_MUL		= 0.75,		-- Multiplier of warscore loss for the sinking of ships for the winner
		WAR_SCORE_FLEET_COMBAT_WIN_BASE		= 0.0,		-- Base score for winning a fleet combat
		WAR_SCORE_PLANET_BASE				= 10.0,		-- Relative warscore value of a planet
		WAR_SCORE_PLANET_BUILDING			= 1.0,		-- Relative warscore value of a planet for every building
		WAR_SCORE_OCCUPATION_MUL			= 1.5,		-- 150% warscore gained from completely occupying the opponents
		WAR_SCORE_PLANET_MIN 				= 5.0,		-- Warscore from 1 planet will never be less than this
		WAR_SCORE_WARGOAL_MULT				= 1.25,		-- Wargoal planets are worth this much more
		WAR_SCORE_MAJOR_WAR_MULT			= 0.5,		-- All warscore gains are multiplied by this in a major war
		
		REBELS_JOIN_DISTANCE_SQRT			= 100.0,	-- Distance threshold if rebels are to join an already existing rebel.
		REBELS_POWER_THRESHOLD 				= 0.5, 		-- A Threshold that controls when rebels think they have a chance, Higher = more unwilling
		
		GARRISON_SIZE_BASE					= 2,		-- Planet always spawns this number of garrisons
		GARRISON_SIZE_MULT					= 0.4,		-- Per pop over 1
		PLANET_FORTIFICATION_BASE			= 1000,		-- Planet always has this much fortification health
		PLANET_FORTIFICATION_MULT			= 100,		-- Per pop over 1
		PLANET_FORTIFICATION_DEFENSE_BONUS	= 10,		-- At 100% fortification, divide damage to defending armies by this
		PLANET_FORTIFICATION_DEFENSE_MIN	= 0.5,		-- At 0% fortification, divide damage to defending armies by this
		PLANET_FORTIFICATION_REPAIR 		= 0.01,		-- Each day
		PLANET_FORTIFICATION_REPAIR_DELAY 	= 60,	-- Days since being bombarded before repairs to fortifications start
		MAX_BOMBARD_FLEET_SIZE				= 200,	-- Fleet size over this won't be counted for how fast planetary defenses are bombed down

		ELECTION_COST						= 200, 	-- Base cost of electing a candidate
		DEMOCRATIC_ELECTION_COST			= 50,	-- Base cost of supporting a candidate democratic election.
		NEXT_ELECTION_MESSAGE_DAYS		    = 90, 	-- Days player can choose a new ruler from new election date
		NEW_RULER_MESSAGE_DAYS				= 45, 	-- Days player can see message of new ruler

		ETHOS_MAX_POINTS					= 3,	-- Number of points which you can spend on ethos.
		ETHOS_DISTRIBUTION_FACTOR 			= 0.5,	-- The higher this is, the more evenly ethics will be distributed among playable empires

		POP_ETHOS_NEW_POP_DIVERGENCE_MULT			= 10,	-- Determines effect of ethics divergence on how likely new pops are to take empire ethics from existing pops
		POP_ETHOS_SAME_SPECIES_MULT					= 10,	-- How much more likely are new pops to take their ethics from same-species pops
		POP_ETHOS_DIVERGENCE_INTERVAL				= 360,	-- Number of days until a Pop has a change to diverge from empire ethos
		POP_ETHOS_DIVERGENCE_RATE_MULT				= 0.1,	-- Base rate multiplier to the chance of Pop Ethics convergence and divergence
		POP_CHANGE_FACTION_CHANCE					= 0.1,	-- Once every month a pop has X chance to change faction, but only if the pop wants to
		POP_JOIN_FACTION_THRESHOLD					= 0.1,	-- A pop can join another faction if the difference in attraction(%) between the new and old factions is greater that this threshold
		POP_CREATE_FACTION_THRESHOLD				= 0.15,	-- A pop can create another faction if the difference in attraction(%) between the new and old factions is greater that this threshold
		POP_FACTION_MINIMUM_MEMBERS					= 0.5,	-- Minimum amount of members relative to default factions required to reach 100% support.
		POP_FACTION_SUPPORT_INCREASE_CHANCE			= 0.15,	-- Once per month, each faction has X% chance to increase their support value. X is calculated based on faction size and pop happines and core-faction strength
		POP_FACTION_SUPPORT_INCREASE				= 0.1,	-- If roll( 100 ) < value calculated above, increase factions' support with this
		POP_FACTION_SUPPRESS_SUPPORT_DECREASE 		= 0.01,	-- The monthly decrease in support for a suppressed pop faction.
		POP_FACTION_SUPPRESS_COST_MIN				= 0.2, -- The minimum scaled monthly suppression influence cost per pop faction.
		POP_FACTION_SUPPRESS_COST_MAX				= 2.0,	-- The maximum scaled monthly suppression influence cost per pop faction reached at the support threshold.
		POP_FACTION_SUPPRESS_COST_SUPPORT_THRESHOLD	= 0.1,	-- The pop faction support threshold at which the maxmimum monthly suppresssion influence cost is reached.

		POLICY_YEARS						= 10, 	-- Years a set policy can not be changed for

		FEDERATION_FIRST_LEADER_YEARS		= 10,	-- Number of years the first leader gets to rule.
		FEDERATION_LEADER_ROTATION_YEARS	= 10,	-- Leader Rotation Years
		FEDERATION_USES_LEADER_ROTATION		= 1,	-- Toggle whether rotation should be used
		FEDERATION_MIN_MEMBERS_TO_KICK		= 3,	-- Can't kick alliance members unless you have at least this many members

		DEBRIS_BASE_COST					= 0,	-- Base cost of special project for analyzing debris
		DEBRIS_ANALYZED_AREA_POINTS			= 5,	-- Points * Level given for each component analyzed
		DEBRIS_ANALYZED_TECH_PROGRESS		= 0.10,	-- Tech progress added when analyzing component that require tech you don't have
		DEBRIS_DAYS							= 1800,	-- How many days the debris is visible for
		DEBRIS_RESEARCH_TIME				= 90,	-- How many days it takes to analyze 1 debris.

		BASE_FLEET_SIZE						= 10,	-- Number of ships allowed in a fleet at game start

		SPECIAL_PROJECT_BASE_PROGRESS		= 1,	-- i in the equation for special project time: x = (k * i) / (i + (y1 - z1) + (y2 - z2)... + (yn - zn))
		MONUMENTAL_UNDERTAKING_DAYS			= 730,	-- project time to consider it a monumental undertaking.
		MODERATE_UNDERTAKING_DAYS			= 180,	-- project time to consider it a moderate undertaking.

		SCIENCE_SHIP_SPECIAL_PROJECT_DIST	= 25.0,	-- Distance to be able to progress a special project

		COLONY_SENSOR_RANGE					= 40.0, -- Base Sensor range from system from having colony in it (does not stack)
		EVENT_AUTOSELECT_MONTHS				= 9, 	-- After these months an event option will be autoselected
		REVOLT_RISK_ALERT					= 0.5,	-- This is the threshold for the revolt risk alert

		SURRENDER_MONTHS					= 6, 	-- For how many months should a war be active after a surrender
		TRUCE_YEARS							= 10, 	-- Truce last for X years
		WARNING_INACTIVE_IN_WAR				= 20,	-- Warscore when warning is sent out for being inactive in war
		ACTION_INACTIVE_IN_WAR				= 50,	-- Warscore when action is sent out for being inactive in war (opinion change etc)

		TERRAFORM_DEFAULT_DURATION_DAYS		= 3600,	-- Default number of days required to successfully terraform a planet
		AUTO_DECLINE_DIPLOMACY_DAYS			= 180,	-- Number of days after which diplomatic action will automatically be declined
		
		FEDERATION_FLEET_SIZE				= 0.2,	-- Federation fleet capacity is this % of all members' fleets
		
		MIN_RIVAL_YEARS						= 10,	-- Years before you can remove an empire as a rival
		DEFENSIVE_PACT_INFLUENCE_COST  		= 1,	-- Per defensive pact
		GUARANTEE_INFLUENCE_COST  			= 1,	-- Per guarantee
		FEDERATION_INFLUENCE_COST  			= 2,	-- For being in a federation
		RIVALRY_INFLUENCE_GAIN				= 1,	-- Per rival (scales to relative power, value here is at 2x power) 	
		
		MAX_FRICTION 						= 100,	-- Max friction (total)
		FRICTION_FROM_BORDERING_SYSTEM 		= 3,	-- Friction for each bordering system
		
		CUSTOM_EMPIRE_SPAWN_CHANCE 			= 100,	-- Chance that an empire will be created from an existing template instead of randomly generated (10 = 1% chance)
		FALLEN_CUSTOM_EMPIRE_SPAWN_CHANCE 	= 50,	-- Chance that a fallen empire will be created from an existing template instead of randomly generated (10 = 1% chance)
		
		PRESCRIPTED_PLANETS_NUM				= 2,	-- The number of prescripted ideal colonies in empire_initializers.txt (don't change one without changing the other)
		PRESCRIPTED_PLANETS_MAX_DISTANCE 	= 50,	-- Max distance of prescripted ideal colonies in empire_initializers.txt (don't change one without changing the other)
		
		START_POPS = 7,						-- This amount of extra pops is generated for starting empires on top of the capital pop
		
		ADVANCED_EMPIRE_EXTRA_POPS_MIN = 1,		-- How many extra pops does advanced empires get on their homeworld?
		ADVANCED_EMPIRE_EXTRA_POPS_MAX = 3,	
		ADVANCED_EMPIRE_EXTRA_MINERALS_MIN = 500, -- How much extra minerals does advanced empires start with?
		ADVANCED_EMPIRE_EXTRA_MINERALS_MAX = 1500,	
		ADVANCED_EMPIRE_EXTRA_ENERGY_MIN = 300,   -- How much extra energy does advanced empires start with?
		ADVANCED_EMPIRE_EXTRA_ENERGY_MAX = 900,	
		ADVANCED_EMPIRE_EXTRA_INFLUENCE_MIN = 50,   -- How much extra influence does advanced empires start with?
		ADVANCED_EMPIRE_EXTRA_INFLUENCE_MAX = 150,	
		ADVANCED_EMPIRE_EXTRA_WARSHIPS_MIN = 3,	-- How many extra war ships do advanced empires start with?
		ADVANCED_EMPIRE_EXTRA_WARSHIPS_MAX = 7,
		ADVANCED_EMPIRE_MAX_EXTRA_COLONIES = 4,	-- Max extra colonies an advanced empire can start with
		ADVANCED_EMPIRE_COLONY_DISTANCE = 50,	-- Max distance at which an advanced empire can get extra colonies
		ADVANCED_EMPIRE_COLONY_CHANCE = 50,		-- Per colonizeable planet within colony distance (after the 1st)
		ADVANCED_EMPIRE_COLONY_POPS = 4,		-- How many pops (besides the first) on each extra colony?
		ADVANCED_EMPIRE_COLONY_NUM_FARMS = 1,
		ADVANCED_EMPIRE_COLONY_NUM_POWER_PLANTS = 2,
	
		ADVANCED_EMPIRE_COLONY_CAPITAL	= "building_capital_1",
		ADVANCED_EMPIRE_COLONY_POWER_PLANT	= "building_power_plant_1",
		ADVANCED_EMPIRE_COLONY_FARM	= "building_hydroponics_farm_1",
	
		MATURE_GALAXY_COLONY_DISTANCE_FIXED = 50,	-- max dist at which planets can be taken (fixed)
		MATURE_GALAXY_COLONY_DISTANCE_RANDOM = 150,	-- max dist at which planets can be taken (random)
		MATURE_GALAXY_COLONY_DISTANCE_SURVEYED = 100,	-- additional dist outside borders that has been surveyed
		MATURE_GALAXY_TECH_TIER = 2,
		MATURE_GALAXY_NAVY_SIZE = 0.5, -- of naval capacity
		MATURE_GALAXY_EXTRA_MINERALS = 10000,
		MATURE_GALAXY_EXTRA_ENERGY = 5000,
		MATURE_GALAXY_EXTRA_INFLUENCE = 1000,
		MATURE_GALAXY_SPACEPORT_LEVEL = 5,
		MATURE_GALAXY_NUM_ARMIES = 10,
	
		MATURE_GALAXY_CAPITAL	= "building_capital_3",
		MATURE_GALAXY_COLONY_CAPITAL	= "building_capital_2",
		MATURE_GALAXY_COLONY_POWER_PLANT	= "building_power_plant_3",
		MATURE_GALAXY_COLONY_FARM	= "building_hydroponics_farm_2",
		MATURE_GALAXY_COLONY_MINE	= "building_mining_network_2",
		MATURE_GALAXY_COLONY_LAB	= "building_basic_science_lab_1",
		MATURE_GALAXY_ARMY = "assault_army",
	
		GROUND_SUPPORT_SOFT_DMG					= 0.30, -- Multiplier to fortification damage
		GROUND_SUPPORT_LIMITED_DMG				= 0.40, -- Multiplier to fortification damage
		GROUND_SUPPORT_FULL_DMG					= 0.50, -- Multiplier to fortification damage

		START_REPARATION_TIMER_DAYS				= 30,	-- Number of days after taking damage before a ship can repair in orbit
		STATION_SELF_REPAIR_TIMER_DAYS			= 10,	-- Number of days after taking damage before a station will start self-repairing
		STATION_SELF_REPAIR_RATE				= 0.01, -- How fast stations self-repair (% of max health each day)

		INFLUENCE_ADD_UPLIFTED_SPECIES			= 500,	-- Influence gain when uplifting species

		PLANET_ARMIES_LIMIT						= 12,	-- Maximum number of troops per planet

		MAX_OBSERVATION_STATIONS 				= 8, 	--Maximum observation stations per planet

		SPACEPORT_CONSTRUCTION_TIME				= 360,	-- Amount of days it takes to construct a spaceport.
		SPACEPORT_CONSTRUCTION_HEALTH			= 0.1,	-- How much HP, in %, that the spaceport starts with.
		SPACEPORT_LEVELS 						= 6,	-- Number of spaceport levels
		SPACEPORT_UPGRADE_TIME					= 180,	--	Time to upgrade a spaceport to the next level

		--SHIP_COST_RESOURCE = "minerals", -- resource to pay ships with

		ANOMALY_RISK_DEFAULT					= 20,	-- Defualt risk if no other is specified for discovery category
		ANOMALY_RISK_MOD_POSITIVE				= -7.5,	-- Positive risk modifier for researching discovery
		ANOMALY_RISK_MOD_NEGATIVE				= 25,	-- Negative risk modifier for researching discovery
		ANOMALY_CRITICAL_FAIL_CHANCE			= 0.20, -- 20% chance of critical fail on fail
		ANOMALY_SPAWN_CHANCE					= 0.025,-- Percent chance that a planet gets a discovery when surveyed
		ANOMALY_SPAWN_CHANCE_INCREMENT			= 0.005,-- Percentage increase towards next chance when failing
		GOVERNMENT_COOLDOWN_YEARS				= 20,	-- Cooldown years after changing government before you can change it again
		GOVERNMENT_CHANGE_INFLUENCE_COST		= 250,	-- The Influence it costs to change government type

		NUM_TECH_ALTERNATIVES					= 3,
		TECH_WEIGHT_BASE						= 10,
		TECH_WEIGHT_POTENTIAL_ADD				= 0,
		TECH_RESEARCH_NO_LEADER_PENALTY			= -0.25,
		TECH_COST_MULT_NUM_COLONIES				= 0.1, -- Each Planet adds +X% tech cost
		TECH_COST_FREE_POPS						= 10, -- First X pops do not add any tech cost
		TECH_COST_MULT_NUM_POPS					= 0.01, -- Each non-free Pop adds +X% tech cost
		TECH_WEIGHT_PREVIOUS_OPTION				= 0.5,	-- If a tech was one of the alternatives last time its weight will be multiplied with TECH_WEIGHT_PREVIOUS_OPTION

		KEYBOARD_DOUBLE_CLICK_TIME				= 0.5,	-- Seconds listening to control group double clicks.
		DOCKED_FLEET_MAINTENANCE_REDUCTION		= 0.25,	-- Docked fleets will have a lowered maintenance reduction of this amount

		TRADE_DIPLOMATIC_OPTIONS 				= 0,	-- If set to 1, you can trade for guarantees, migration access, NAPs and support independence instead of having them as diplomatic actions
		MIN_TRADE_DEAL_LENGTH_YEARS				= 10,	-- Minimum length of a trade deal in years.
		MAX_TRADE_DEAL_LENGTH_YEARS				= 30,	-- Maximum length of a trade deal in years.

		ORBITAL_BOMBARDMENT_COLONIZE_PROGRESS_DAMAGE_PER_DAY = 4 / 30, -- Damage dealt to a colony's progress each day of orbital bombardment. Only applies during the initial colonization process, established colonies are unaffected.

		MISSION_PROGRESS_MAX					= 1,	-- When is a mission finished?

		CORE_SECTOR_SYSTEM_CAP					= 5,	-- Too many systems with owned planets in core sector will apply modifier inefficient_planet_management.
		SECTOR_CAP								= 2,	-- Too many sectors will apply modifier inefficient_sector_management.
		SECTOR_CAP_INCR							= 0.25,	-- 0.25 means that for every four planets an extra sector can be created.
		SECTOR_SUPPORT_RESOURCE_AMOUNT			= 100, 	-- How much resources each click will give the sector.
		SECTOR_REVOKE_SYSTEM_COST				= 25,	-- Influence cost for revoking a system from a sector

		NEW_HEIR_CHANCE							= 0.05,	-- Chance to get a new heir each day. Range is 0 to 1
		ELECTIONS_BASE_UNCERTAINTY				= 0.1,	-- ( -5% to 5% ) to each election candidate

		GROUNDSUPPORT_STANCE_SOFT_REQUIRED_POLICY_FLAG	= "allow_orbital_bombardment_light",	-- Each ground support stance can require that a certain policy flag is set
		GROUNDSUPPORT_STANCE_LIMITED_REQUIRED_POLICY_FLAG	= "allow_orbital_bombardment_limited",
		GROUNDSUPPORT_STANCE_FULL_REQUIRED_POLICY_FLAG	= "allow_orbital_bombardment_full",

		BORDER_INFLUENCE_THRESHOLD 				= 0.15,	-- Min threshhold for countries to be considered intersecting

		SET_DEFENDER_WAR_DEMANDS_TIME_LIMIT		= 360,	-- Days defender have to set war demands after war started.
		PEACE_OFFER_DECLINE_THRESHOLD			= 30.0,	-- War score diff threshold for when declining a peace offer has a cost applied.
		PEACE_OFFER_DECLINE_COST				= 100.0, -- Cost for declining an offer the AI would accept.
	
		RESOURCE_CLUSTER_COUNT					= 6, 	-- Number of resource clusters containing special resources
	
		POP_MIGRATION_NOT_ALLOWED_POLICY_FLAG	= "migration_not_allowed", -- Policy flag for pop migration not allowed (used by migration access)
		POP_MIGRATION_ALLOWED_PRIMARY_ONLY_POLICY_FLAG	= "migration_allowed_primary_only", -- Policy flag for pop migration not allowed (used by migration access)

		POP_SLAVERY_NOT_ALLOWED_POLICY_FLAG	= "slavery_not_allowed", -- Policy flag for pop slavery not allowed 
		POP_PURGE_NOT_ALLOWED_POLICY_FLAG	= "purge_not_allowed", -- Policy flag for pop purge not allowed 
	
		RESEARCH_AGREEMENT_COST_MULT			= -0.25,	-- Technology cost reduced with 25% for trade research agreement deal

		MOVE_CAPITAL_INFLUENCE_COST				= 250,	-- Influence cost to move the empire capital to another planet.
		MOVE_CAPITAL_COOLDOWN_YEARS 			= 10,  	-- Cooldown in years for moving capital.
		
		INTEGRATE_SUBJECT_MIN_DAYS 				= 3600, -- Amount of days the subject has been a subject before we can integrate it
		SUBJECTS_INTEGRATION_CAP				= 1, -- Amount of integrations you're allowed to have at the same time
		SUBJECT_INTEGRATION_BASE_PROGRESS 		= 5, -- Cost per month for subject integration
		SUBJECT_INTEGRATION_COST_BASE			= 20, -- Base cost for integration
		SUBJECT_INTEGRATION_COST_PER_POP 		= 5, -- Integration cost per pop 
		SUBJECT_INTEGRATION_COST_PER_PLANET		= 50, -- Integration cost per planet
		XENOPHOBIA_SAME_SPECIES_CLASS_MULT  	= 0.5, -- Same Species Class: All Xenophobia and Xenophilia happiness and opinion effects are multiplied by this
		XENOPHOBIA_SUBSPECIES_MULT  			= 0.25, -- Subspecies: All Xenophobia and Xenophilia happiness and opinion effects are multiplied by this
		XENOPHOBIA_ROBOT_MULT  					= 0.25, -- Robots and Synthetics: All Xenophobia and Xenophilia happiness and opinion effects are multiplied by this
		XENOPHOBIA_CLIENT_PATRON_MULT  			= 0.25, -- Uplifed vs Uplifter: All Xenophobia and Xenophilia happiness and opinion effects are multiplied by this
		XENOPHOBIA_ALIEN_OVERLORDS_MULT  		= 2, 	-- Unhappiness effect Multiplier for Xenophobe Pops within Alien empires

		NAVY_SIZE_MAX										= 9999,	-- Max value of Naval Capacity
		NAVY_SIZE_BASE 										= 10,	-- Base value of Naval Capacity
		NAVY_SIZE_POP_MULT									= 0.25,	-- Mult value of Naval Capaicty for each Pop
		NAVY_SIZE_SPACEPORT_LEVEL							= { 2, 4, 6, 9, 12, 15 }, -- Naval Capacity per spaceport level
		
		STARTING_WEAPON_TECHS = {
			"tech_mass_drivers_1",
			"tech_lasers_1",
			"tech_missiles_1",
		},
		STARTING_WEAPON_TECHS_ICONS = {
			"GFX_weapon_type_01",
			"GFX_weapon_type_02",
			"GFX_weapon_type_03",
		},
		STARTING_FTL_TYPES = {
			"warp",
			"hyperdrive",
			"wormhole",
		},
		-- TECH_TO_SURVEY_OWNED = "tech_galactic_ambitions",
	},

	NSpecies = {
		MAX_ETHIC_POINTS 					= 3,
		MAX_TRAIT_POINTS 					= 2,
		MAX_TRAITS 							= 5,		-- Max racial traits (1 is always used for homeworld type trait)
		MAX_TRAIT_POINTS_LEADER				= 1,		-- How many trait points a leader can have
		MAX_TRAIT_POINTS_RULER				= 2,
		TRAIT_MODIFICATION_COST_MULT 		= 100, 		-- The cost of the species modification special project is trait cost * this
		UPLIFT_COST_BASE					= 5000.0,
		TRAIT_MODIFICATION_TIME_LIMIT		= 90,		-- Days it takes to modify a species
		HOMEWORLD_HABITABILITY				= 1.0,		-- Habitability on homeworld is always this value
	},

	NShip = {
		DESIGNER_WEAPON_PREF_MUL			= 1.33,			-- How much does weapon preference tags in the ship designer affect the weight it assigns a weapon?
		DESIGNER_WEAPON_STACKING_DIV		= 0.20,			-- The higher this is, the more the ship designer will try to vary which weapon types are used on its sections
		
		ENERGY_MAINTENANCE_MUL				= 0.004,		-- Ship Maintenance Multiplier, Percentage of the cost of the ship
		MINERAL_MAINTENANCE_MUL				= 0.004,		-- Ship Maintenance Multiplier, Percentage of the cost of the ship
		REPAIR_RATE							= 0.01,		-- Repair rate per day
		REPAIR_COST_MUL						= 0.35,		-- Ship Repair Cost Multiplier, Percentage of the cost of the ship
		REPAIR_SHIELD_MUL					= 1.0,		-- Shields regen faster when ship is being repaired.
		POOR_MAINTENANCE_PENALTY			= 0.01,		-- 1% percent max hit points penalty each day for poor maintenance (energy < 0)
		
		FALLEN_EMPIRE_MAINTENANCE_MULT		= 0.25,
		AWAKENED_FALLEN_EMPIRE_MAINTENANCE_MULT		= 0.5,
		AWAKENED_FALLEN_EMPIRE_NAVAL_CAPACITY_MIN 	= 1000,
		FALLEN_EMPIRE_NAVAL_CAPACITY_MIN 	= 500,

		MOVE_SHIP_TO_FLEET_MAX_DIST			= 50.0,

		COST_SECTION_MUL					= 0.25,
	    COST_SECTION_BASE					= 50.0,
	    COST_SECTION_ADD_SMALL_WEAPON_SLOT	= 10.0,
		COST_SECTION_ADD_MEDIUM_WEAPON_SLOT	= 20.0,
		COST_SECTION_ADD_LARGE_WEAPON_SLOT	= 30.0,
		COST_SECTION_ADD_TORPEDO_WEAPON_SLOT = 20.0,
		COST_SECTION_ADD_EXTRA_LARGE_WEAPON_SLOT	= 30.0,
		COST_SECTION_ADD_AUX_WEAPON_SLOT	= 10.0,
		COST_SECTION_ADD_SMALL_UTIL_SLOT	= 10.0,
		COST_SECTION_ADD_MEDIUM_UTIL_SLOT	= 30.0,
		COST_SECTION_ADD_LARGE_UTIL_SLOT	= 60.0,
		COST_SECTION_ADD_AUX_UTIL_SLOT		= 10.0,

		FLEET_MOVE_MAX_DIST_SHIPS			= 10.0,		-- Max distance that ships are allowed to travel before last ship

		FLEET_BASE_FORMATION_SCALE			= 2.0,
		FLEET_BASE_FORMATION_DIV			= 10,

		LANDING_TIME_DAYS					= 10,	-- Amount of days it takes to land an army

		MOVE_TO_ACTION_THRESHOLD			= 5.0,	-- distance threshold used by move_to fleet action to determine when the fleet arrived

		WARP_WINDUP 						= 1.0, 	-- Distance multiplier to warp windup in microupdates
		WARP_WINDDOWN 						= 5.5, 	-- Distance multiplier to warp winddown in microupdates
		WARP_WINDDOWN_OUTSIDE_BORDER		= 2.0,	-- How much more winddown time is there for systems which are 100% away from friendly territory
		WARP_INTERSTELLAR_TRAVEL_SPEED 		= 0.35, -- In micro updates ( 10/day )

		HYPERLANE_WINDUP 					= 150,	-- In micro updates ( 10/day )
		HYPERLANE_WINDDOWN					= 0,	-- In micro updates
		HYPERLANE_WINDUP_OUTSIDE_BORDER		= 5.0,	-- How much more windup time is there for systems which are 100% away from friendly territory
		JUMPDRIVE_WINDUP					= 150,	-- In micro updates ( 10/day )
		JUMPDRIVE_WINDDOWN					= 50,	-- In micro updates ( 10/day )
		HYPERDRIVE_INTERSTELLAR_TRAVEL_SPEED = 1.0, -- In micro updates ( 10/day )
		RULER_SHIP_SCALE_MULT				= 0.5,	-- Scale up of unique ruler ship.
		
		MILITARY_POWER_HEALTH_WEIGHT		= 0.5,
		MILITARY_POWER_SHIELD_WEIGHT		= 0.66,	-- compared to health
		MILITARY_POWER_DAMAGE_WEIGHT		= 0.5,
		MILITARY_POWER_SCALE				= 0.10,
		MILITARY_POWER_EXPONENT				= 0.75,	-- math: power = ( ( effective_health * damage_per_day ) ^ exponent ) * scale
		
		-- below values determine how large an effect special values such as shield penetration have on the military power of a weapon
		MILITARY_POWER_ARMOR_PENETRATION_WEIGHT = 0.5,	-- larger value = adds more military power
		MILITARY_POWER_SHIELD_PENETRATION_WEIGHT = 0.5,
		MILITARY_POWER_SHIELD_DAMAGE_WEIGHT = 0.33,		
		MILITARY_POWER_TRACKING_WEIGHT = 0.2,	
		MILITARY_POWER_RANGE_DIV = 100,	-- smaller value = adds more military power
		MILITARY_POWER_MISSILE_MULT = 0.8,		-- overall military power of missiles is lowered due to being vulnerable to PD
		
		DEFAULT_ARMOR_RATIO = 0.4,
		DEFAULT_SHIELD_RATIO = 0.5,
		MIN_COMBAT_SPEED_FOR_AFTERBURNERS = 1.25,
		
		MILITARY_POWER_SPACEPORT_BASE_MULT		= 0.8,
		MILITARY_POWER_SPACEPORT_LEVEL_MULT		= -0.05,
		
		EXCESS_POWER_BONUS_THRESHOLD_MAX	= 1.0, 	-- 0.5 means 0-50% excess power linearly scales ship_excess_power modifier between 0-1.
		EXCESS_POWER_BONUS_THRESHOLD_MIN	= 0.05, -- min value for excess power to be used.
	},

	NCombat = {
		-- When ships are attacking they will try to stay at max range and orbit their target.
		-- If the ship is closer than max range this value determines how fast it will "back off" in order to get to max range.
		-- 0.0 means that the ship will not back off, and orbit with whatever radius it already has
		-- 1.0 means that the ship will prioritize orbit velocity the same as "back-off"-velocity. i.e a 45º angle
		COMBAT_BACK_OFF_RATE					= 0.04,
		
		FORMATION_POS_AHEAD_OF_PARENT			= 0.5,

		SHIP_SMOOTH_ROTATION_THRESHOLD			= 3.141, -- Used to smooth rotation rate of ships. equation is "y = x * ( min ( 1.0, x / SHIP_SMOOTH_ROTATION_THRESHOLD ) )" where x is the wanted delta rotation this tick and y the resulting delta rotation

		COMBAT_DETECT_RANGE_MULT				= 1.05,	-- Range to engage in combat with other ships is <fleets max attack range> * COMBAT_DETECT_RANGE_MULT
		COMBAT_DETECT_RANGE_MIN					= 10,
		COMBAT_AREA_MIN_ATTACK_RADIUS			= 0.2,
		COMBAT_EMERGENCY_FTL_PENALTY_HITPOINTS 	= 0.20, -- x% of max hitpoints in penalty for doing ftl jump
		COMBAT_EMERGENCY_FTL_LOST_RISK 			= 0.01, -- x% risk of ship becoming forever lost when jumping.
		COMBAT_EMERGENCY_FTL_SURVIVE_CHANCE 	= 0.50, -- x% chance to survive with 1 health even if ship should have died
		COMBAT_EMERGENCY_FTL_WINDUP				= 2.0, 	-- how many days it takes from the button press to the actual jump. same timer for all FTL types
		COMBAT_BASE_DAYS_UNTIL_EMERGENCY_FTL 	= 30.0,	-- how many days a fleet should be in combat until they can emergency ftl
		CIVILIAN_EMERGENCY_FTL_MULT				= 0.25,

		MISSILE_HIGH_CONTROL_DISTANCE				= 5.0, -- if the missile is closer to the target than MISSILE_HIGH_CONTROL_DISTANCE it will turn sharply
		MISSILE_HIGH_CONTROL_INTERPOLATION_RANGE	= 5.0, -- how long the missile will interpolate between "smooth controls" and "full control"
		MISSILE_BASE_ROTATION_SPEED					= 0.001, -- base rotation rate of missiles, in radians per tick

		SHIP_TARGETING_NUM_SHOTS_FOR_LOW_HEALTH_BONUS = 5,
		DAMAGE_REDUCTION = 70,								-- armor / DAMAGE_REDUCTION
		SIZE_MULTIPLIER_DAMAGE_REDUCTION_EFFECT = 0.15,		-- how much does ship size reduce damage reduction from armor (higher number = more armor required for same DR on a larger ship)
		DAMAGE_REDUCTION_MAX_SHIP_SIZE = 10,		-- ship sizes over this don't affect how much armor is needed
		DAMAGE_REDUCTION_HIGH = 0.75,							-- above this level of damage reduction, require even more armor
		DAMAGE_REDUCTION_HIGH_SCALING = 0.5,							
		DAMAGE_REDUCTION_MAX = 0.9,							-- can't have more damage reduction than this
	},

	NPop = {
		MAX_POPS_BASE 						= 10,		-- Max pops is base multiplied by planet size
		MIGRATION_CROWDING_EFFECT			= 0.25,		-- How much does crowding affect where pops want to migrate
		MIN_HAPPINESS_DIFF_FOR_MIGRATION 	= 0.1,		-- Only if the difference in happiness is greater than this will a pop migrate
		MIGRATION_SPEED						= 0.05,		-- Monthly migration speed of pops: when the pop has reached a migration progress of 1, it will be moved
		WAS_ENSLAVED_LENGTH_DAYS			= 1825,		-- Number of days after emancipation a pop is angry for being enslaved
		
		GROWTH_BASE							= 25,	-- Required growth for a pop to become fully grown.
		GROWTH_INCREASE_PER_POP 			= 1.65,	-- Increased growth cost per pop planet [+ POP_INCREASE_PER_POP*(num_pop - 1)]
		GROWTH_INCREASE_FACTOR 				= 1.12,	-- Increased growth factor [+ (num_pop - 1)^POP_INCREASE_FACTOR]
		FALLEN_EMPIRE_GROWTH_REQ_MULT		= 40,	-- Fallen Empire pops need this much more food for growth
		
		FOOD_SUSTAINED						= 1,	-- Amount of food each pop require	
		FOOD_SURPLUS_BASE_GROWTH			= 1,	-- Amount to grow if there is a surplus
		FOOD_SURPLUS_EXTRA_GROWTH 			= 0.10,	-- Amount to grow per food surplus over 1

		MIN_PRODUCTION_HAPPINESS 		= 0.2,		-- Minimum required happiness for generating production, no production generated below this level
		MIN_PRODUCTION_HAPPINESS_LEVEL 	= 0.25,		-- Minimum production generated at the minimum required happiness level
		MAX_PRODUCTION_HAPPINESS 		= 0.8,		-- Maximum amount of happiness where pops have maximum production
		MAX_PRODUCTION_HAPPINESS_LEVEL 	= 1.0,		-- Maximum amount of production generated at maximum happiness

		MIN_REVOLT_HAPPINESS 			= 0.0,		-- Minimum happiness for revolt risk
		MIN_REVOLT_HAPPINESS_LEVEL 		= 1.0,		-- Minimum revolt risk at the minimum revolt risk happiness
		MAX_REVOLT_HAPPINESS 			= 0.35,		-- Maximum happiness for revolt risk
		MAX_REVOLT_HAPPINESS_LEVEL 		= 0.0,		-- Maximum revolt risk at the maximum revolt risk happiness

		MIN_REVOLT_SLAVE_HAPPINESS 			= 0.0,	-- Minimum happiness for revolt risk
		MIN_REVOLT_SLAVE_HAPPINESS_LEVEL 	= 0.5,	-- Minimum revolt risk at the minimum revolt risk happiness
		MAX_REVOLT_SLAVE_HAPPINESS 			= 0.60,	-- Maximum happiness for revolt risk
		MAX_REVOLT_SLAVE_HAPPINESS_LEVEL 	= 0.0,	-- Maximum revolt risk at the maximum revolt risk happiness

		WAS_PURGED_LENGTH_DAYS				= 5400,	-- Number of days after purging a pop is angry for being genocided
		EXTERMINATION_MONTHS				= 30,	-- Number of months it takes to exterminate a population when purging

		HAPPINESS_PROGRESS_BAR_GREEN 		= 75, 	-- Happiness percentage min where bar is showed as green
		HAPPINESS_PROGRESS_BAR_YELLOW 		= 25,	-- Happiness percentage min where bar is showed as yellow; below this value, bar will be shown in red

		BASE_RESEARCH					= 1.0,	-- Base value of pop research
		BASE_PRODUCTION					= 1.0,  -- Base value of pop production
		BASE_HAPPINESS					= 0.50,  -- Base value of pop happiness
		
		EMPIRE_SLAVERY_HAPPINESS_MULT	= 0.5, -- How much local Pops care about slavery in the empire as a whole. The higher will be used: the local slavery proportion or empire-wide proportion times this multiplier.

		RECENTLY_CONQUERED_DAYS			= 3650, -- How long the recently conquered modifier stays on pops.

		FACTION_SUPPORT_LEVELS 			= { 1.0, 5.0, 0.75, 30.0, 0.50, 65.0, 0.25, 100.0 },	-- In pairs, first is happiness, second is amount of support.
	},

	NArmy = {
		BASE_MAINTENANCE_FACTOR 		= 1,				-- global base maintenance cost
		REINFORCE_MAINTENANCE_FACTOR 	= 1.50,				-- 50% increase of maintenance cost
		MONTHLY_REINFORCE 				= 0.2,				-- Monthly health percentage reinforcement of armies

		BASE_HEALTH						= 200.0,			-- Base health
		BASE_DAMAGE_MIN					= 1.5,				-- Base min damage
		BASE_DAMAGE_MAX					= 3.0,				-- Base max damage

		BASE_MORALE						= 200.0,			-- Base morale
		MORALE_DAMAGE_MULT				= 1.0,				-- Morale Damage Multiplier, how much of damage is also dealt to morale.
		MONTHLY_MORALE_REGENERATION		= 0.4,				-- How much morale this unit regenerates each month, percentage of max value.

		EXP_EXPERIENCED					= 100,				-- Amount of exp to reach experienced rank
		EXP_VETERAN						= 1000,				-- Amount of exp to reach veteran rank
		EXP_ELITE						= 10000,			-- Amount of exp to reach elite rank

		NUM_DAYS_BEFORE_RETREAT			= 14,				-- How many days that need to pass before we can retreat.

		ATTACHMENT_SLOTS				= 1,
	},

	NEconomy = {
		MILITARY_STATION_MAINTENANCE_MUL	= -0.25,		-- Monthly military station maintenance reduction

		COLONY_MONTHLY_GROWTH				= 2.0,	-- How much the colonization pop grows every month.
		COLONY_MAINTENANCE_COST 			= 8,		-- Base cost per month for a new colony.
		START_ENERGY 						= 50.0,	-- The amount of money each country starts with
		START_INFLUENCE 					= 100.0,	-- The amount of influence each country starts with
		START_MINERALS						= 200.0,	-- The amount of minerals each country starts with
		MINING_STATION_MAINTENANCE 			= 1.0,		-- Monthly mining station maintenance
		RESEARCH_STATION_MAINTENANCE 		= 1.0,		-- Monthly research station maintenance
		ORBITAL_STATION_MAINTENANCE			= 3.0, 		-- Monthly orbital station maintenance cost
		TERRAFORM_STATION_MAINENANCE		= 0.0,		-- Monthly terraform station maintenance
		WORMHOLE_STATION_MAINTENANCE 		= 0.25,		-- Monthly wormhole station maintenance
		CONSTRUCTION_SHIP_MAINTENANCE 		= 1.0, 	-- Monthly construction ship maintenance
		SCIENCE_SHIP_MAINTENANCE			= 1.0, 	-- Monthly science ship maintenance
		COLONY_SHIP_MAINTENANCE 			= 8.0, 		-- Monthly colony ship maintenance
		CONSTRUCTION_SHIP_PRODUCTION		= 100.0, 	-- Construction ship production cost
		SCIENCE_SHIP_PRODUCTION				= 100.0, 	-- Science ship production cost
		SPONSORED_COLONY_SHIP_COST_MULT		= -0.50,	-- Sponsored colony ship energy cost = colony ship mineral cost * (1 + MULT)
		FLEET_UPGRADE_TIME_COST_MULT		= 0.75,		-- Upgrade fleet cost
		FLEET_UPGRADE_MINERAL_COST_BASE		= 5.0,		-- mineral cost to upgrade a ship is always at least this, regardless of relative design cost
		FLEET_UPGRADE_MINERAL_COST_MULT		= 0.75,		-- mineral cost of ship upgrade is abs( price difference between old and new designs * FLEET_UPGRADE_MINERAL_COST_MULT )
		OBSERVATION_STATION_MAINTENANCE		= 1.0,		-- Monthly observation station maintenance
		SPACEPORT_UPGRADE_COSTS				= { 200.0, 250.0, 300.0, 350.0, 400.0 }, -- Mineral costs for upgrading the spaceport
		SEVERE_DEFICIT_VALUE				= 0.8,		-- Balance/Income smaller than this value counts as severe
		OUTPOST_STATION_MINERAL_COST		= 200,		-- Mineral cost to build outpost
		OUTPOST_STATION_INFLUENCE_COST		= 0.0,		-- Influence cost to build outpost
		OUTPOST_STATION_MAINTENANCE			= 3,		-- Monthly outpost station EC maintenance
		OUTPOST_STATION_INFLUENCE_MAINTENANCE = 1.0,	-- Monthly outpost station Influence maintenance

		BUILDING_REPARATION_TIME_RATE		= 0.25,		-- Amount of time required to repair ruined buildings
		BUILDING_REPARATION_COST_RATE		= 0.25,		-- Amount of resources required to repair ruined buildings
		
		RESETTLEMENT_COST_RESOURCES			= { "influence" }, -- Resources for manual resettlement
		RESETTLEMENT_COST_AMOUNTS			= { 50 }, -- Resource costs for manual resettlement
		 
		EXPANSION_COST_BASE 				= 30.0,		-- the influence base cost of colonzation and frontier outposts by this value.
		EXPANSION_COST_DISTANCE_FREE 		= 30.0,		-- a certain amount of distance that is reduced from actual distance, in effect making a "free" distance
		EXPANSION_COST_DISTANCE_COST		= 2.0,		-- each 1 range equals X of this define as an influence cost to colonize or build a frontier outpost
		EXPANSION_COST_DISTANCE_SCALE 		= 1.10,		-- scaled cost for exponentially increased costs depending on range
	},

	NEngine = {
		EVENT_PROCESS_OFFSET = 20 			-- OBSOLETE: MTTH events are now checked monthly. [Events are checked every X day per country or planet (1 is ideal, but CPU heavy)]
	},

	NAI = {
		WAS_HUMAN_MONTHS = 60,							-- Amount of months that the AI will refrain from making large changes to the empire if it's taking over from a player
		
		MAX_SHIPS_BUILD_PER_WEEK = 10,					
		MAX_SHIPS_DISBAND_PER_WEEK = 5,
		
		MIN_GIFT_SIZE = 25,								-- in opinion impact
		MAX_GIFT_SIZE = 50,
		
		MAX_TRUST = 100,								-- trust can never be more than this
		MAX_TRUST_DEFENSIVE_PACT = 100,					-- trust can tick up to this if defensive pact
		MAX_TRUST_ASSOCIATE = 100,						-- trust can tick up to this if federation associate
		MAX_TRUST_NAP = 75,								-- trust can tick up to this if non-aggression pact
		MAX_TRUST_MIN = 50,						-- trust can always tick up to at least this
		BASE_TRUST_CHANGE = -0.25,						-- only applied if no other factor is changing trust
		MONTHLY_TRUST_GUARANTEE = 0.25,
		MONTHLY_TRUST_RESEARCH_TREATY = 0.10,
		MONTHLY_TRUST_MIGRATION_TREATY = 0.25,
		MONTHLY_TRUST_NON_AGGRESSION_PACT = 0.50,		
		MONTHLY_TRUST_ASSOCIATION_STATUS = 0.50,		
		MONTHLY_TRUST_DEFENSIVE_PACT = 0.75,				
		MONTHLY_TRUST_SUBJECT = 0.5,				
		MONTHLY_TRUST_FEDERATION = 1.00,				
		MONTHLY_TRUST_AT_WAR = -2.00,
		MONTHLY_TRUST_RIVAL = -2.00,
		
		WARLEADER_WARGOAL_FACTOR = 1.5,					-- AI is this much more likely to pick wargoals against the enemy war leader instead of their allies
	
		DEFICIT_SPENDING_START_WAR = 0.25,				-- If at war and energy is at this fraction of max storage, deficit spend energy
		DEFICIT_SPENDING_START_PEACE = 0.75,			-- If at peace and energy is at this fraction of max storage, deficit spend energy
		DEFICIT_SPENDING_STOP_WAR = 0.1,				-- If at war and energy is at this fraction of max storage, stop deficit spending
		DEFICIT_SPENDING_STOP_PEACE = 0.5,				-- If at peace and energy is at this fraction of max storage, stop deficit spending
		DEFICIT_SPENDING_MONTHLY_PEACE = 0.003,				-- This percentage of max storage should be deficit spent each month when at peace
		DEFICIT_SPENDING_MONTHLY_WAR = 0.005,				-- This percentage of max storage should be deficit spent each month when at war
	
		BROKEN_TRADE_DEAL_FACTOR = 0.1,				-- How much does each broken trade deal affect future trade willingness ( * value of deal and years )
		BROKEN_TRADE_DEAL_MAX = 50,	
		BROKEN_TRADE_DEAL_DECAY = -0.05,			-- Per month
	
		THREAT_PLANET_MULT = 5,						-- Base threat multiplier for planet
		THREAT_POP_MULT = 0.1,						-- Base threat multiplier for pop
		
		HIGH_THREAT_THRESHOLD = 50,					-- Must have at least this much threat to become fearful		
		SHARED_THREAT_MULT = 0.5,					-- How much does having a shared threat boost opinion?
		THREAT_SHARED_THREAT_REDUCTION = 4,			-- Each point of threat will also eliminate this much shared threat
		SHARED_THREAT_MAX = 200,	 				
		THREAT_DECAY = -0.25,							-- Each month
		THREAT_DISTANCE_FACTOR = 0.01,				-- The higher this is, the larger the threat reduction from being far away
		THREAT_SIZE_FACTOR = 1.0,					-- How much does the relative power of the aggressive empire affect threat?
		THREAT_SIZE_FACTOR_MAX = 2.0,
		THREAT_SIZE_FACTOR_MIN = 0.1,
		THREAT_NAP_FACTOR = 0.5,					-- How much is threat lowered if we have a NAP or defensive pact?
		THREAT_POSITIVE_OPINION_FACTOR = 0.002,		-- How much does opinion of the victim affect threat?
		THREAT_NEGATIVE_OPINION_FACTOR = 0.002,
		THREAT_OPINION_MAX = 1.25,
		THREAT_OPINION_MIN = 0.75,
		
		COLONIZE_NON_ADJACENT = 0,				-- If enabled, AI will colonize far away systems (will result in border gore)
		COLONIZE_NON_ADJACENT_DIV = 3,			-- If colony is far away, divide priority to colonize it by this
	
		AI_AGGRESSIVENESS_LOW_MULT = 0.5,		
		AI_AGGRESSIVENESS_HIGH_MULT = 2.0,			
		AI_AGGRESSIVENESS_BASE = 25,			-- Base chance AI will declare a war (multiplied by personality aggressiveness score)
		AI_AGGRESSIVENESS_PROPAGATOR_BOXED_IN_MULT = 10,	-- When a warlike 'propagator' personality is boxed in, aggression is multiplied by this value
		AI_AGGRESSIVENESS_BOXED_IN_MULT = 4,	-- When an AI can no longer peacefully expand, aggression is multiplied by this value
		AI_AGGRESSIVENESS_NO_COLONY_TARGET_MULT = 2, -- When an AI has no immediate colony targets and at least MAX_PLANETS_FOR_BUDGET_FACTOR planets (but is not boxed in), aggression is multiplied by this value
	
		MAX_RESOURCE_SCORE = 10000,				-- Maximum amount AI will value a resource at
		MAX_RESOURCE_SCORE_DIV = 1000,			-- Resources that aren't critical prio are divided by this amount
	
		ACTION_MIN_DAYS_REJECTED = 1000,		-- AI will remember a rejection at least this time
		ACTION_MIN_DAYS_REJECTED_PEACE = 150,	-- AI will remember a peace deal rejection at least this time
		ACTION_DAYS_REJECTED_RANDOM = 730,		-- Max random extra days AI will reject offer
		INSTANT_AI_DIPLOMACY = 0,				-- AI answers diplomacy immediately. No proposals are sent off to AIs.
		ACTION_DAYS_REJECTED_RANDOM_PEACE = 100,-- Max random extra days AI will reject peace offer
		DIPLO_BREAK_THRESHOLD = -30,		-- If AI values an existing deal at less than this, break it
		
		ACCEPTANCE_DEAL_BREAKER = -1000,	-- This is used when something is a deal breaker in diplomacy
		ACCEPTANCE_DEAL_ALWAYS = 1000,			-- This is used when the AI should always accept a deal

		-- Below are various acceptance factors for specific actions
		FEDERATION_ACCEPTANCE_OPINION_FACTOR = 0.1,
		FEDERATION_ACCEPTANCE_VOTED_DOWN_PROPOSAL = -50,
		FEDERATION_ACCEPTANCE_ATTITUDE_ALLIANCE = 30,
		FEDERATION_ACCEPTANCE_ATTITUDE_COEXIST = 0, 
		FEDERATION_ACCEPTANCE_OTHER_ATTITUDE = -50,
		FEDERATION_ACCEPTANCE_SHARED_RIVAL = 10, -- per rival
		FEDERATION_ACCEPTANCE_SHARED_RIVAL_IN_FEDERATION = 5, -- extra per rival in alliance
		FEDERATION_ACCEPTANCE_SHARED_THREAT = 0.25,	-- scales with actual threat
		FEDERATION_CONQUEROR_DIFFERENCE = -50,	-- penalty if one side wants to wage wars of conquest and the other doesn't
		FEDERATION_CONQUEROR_POLICY_FLAG = "unrestricted_wars",
		FEDERATION_ACCEPTANCE_RELATIVE_STRENGTH_FACTOR = 5, -- For each 1x we are stronger than them
		FEDERATION_ACCEPTANCE_RELATIVE_STRENGTH_MAX = 20,
		FEDERATION_ACCEPTANCE_MEMBER_VOTE = 100,	-- added to acceptance when a member is voting whether to approve an alliance invite
		FEDERATION_ACCEPTANCE_MEMBER_VOTE_SIZE_FACTOR = -10,	-- for each member above two, 
		FEDERATION_ACCEPTANCE_MEMBER_VOTE_MIN = 50,
		FEDERATION_ACCEPTANCE_ASSOCIATION_VOTE = 100,
		FEDERATION_ACCEPTANCE_DISTANCE_MULT = -0.1, -- per 1 border distance
		
		DEFENSIVE_PACT_ACCEPTANCE_OPINION_FACTOR = 0.2,
		DEFENSIVE_PACT_ACCEPTANCE_ATTITUDE_ALLIANCE = 50,
		DEFENSIVE_PACT_ACCEPTANCE_ATTITUDE_COEXIST = 20, 
		DEFENSIVE_PACT_ACCEPTANCE_OTHER_ATTITUDE = -50,
		DEFENSIVE_PACT_ACCEPTANCE_NUM_PACTS = -20,	-- per existing defensive pact
		DEFENSIVE_PACT_ACCEPTANCE_SHARED_RIVAL = 50, -- per rival
		DEFENSIVE_PACT_ACCEPTANCE_SHARED_ALLY = 30, -- per shared ally
		DEFENSIVE_PACT_ACCEPTANCE_SHARED_THREAT = 0.5,	-- scales with actual threat
		DEFENSIVE_PACT_ACCEPTANCE_RELATIVE_STRENGTH_FACTOR = 5, -- For each 1x we are stronger than them
		DEFENSIVE_PACT_ACCEPTANCE_RELATIVE_STRENGTH_MAX = 20,
		DEFENSIVE_PACT_ACCEPTANCE_DISTANCE_MULT = -0.1, -- per 1 border distance
		
		NON_AGGRESSION_PACT_ACCEPTANCE_OPINION_FACTOR = 0.2,
		NON_AGGRESSION_PACT_ACCEPTANCE_ATTITUDE_ALLIANCE = 100,
		NON_AGGRESSION_PACT_ACCEPTANCE_ATTITUDE_COEXIST = 100, 
		NON_AGGRESSION_PACT_ACCEPTANCE_OTHER_ATTITUDE = 0,
		NON_AGGRESSION_PACT_ACCEPTANCE_SHARED_RIVAL = 50, -- per rival
		NON_AGGRESSION_PACT_ACCEPTANCE_SHARED_THREAT = 0.5,	-- scales with actual threat
		NON_AGGRESSION_PACT_ACCEPTANCE_RELATIVE_STRENGTH_FACTOR = 20, -- For each 1x we are stronger than them
		NON_AGGRESSION_PACT_ACCEPTANCE_RELATIVE_STRENGTH_MAX = 100,	
		NON_AGGRESSION_PACT_ACCEPTANCE_DISTANCE_MULT = -0.1, -- per 1 border distance
		
		MIGRATION_PACT_ACCEPTANCE_OPINION_FACTOR = 0.5,
		MIGRATION_PACT_ACCEPTANCE_ATTITUDE_ALLIANCE = 30,
		MIGRATION_PACT_ACCEPTANCE_ATTITUDE_COEXIST = 10, 
		MIGRATION_PACT_ACCEPTANCE_OTHER_ATTITUDE = 0,
		MIGRATION_PACT_ACCEPTANCE_MIGRATOR_PERSONALITY = 20,
		MIGRATION_PACT_ACCEPTANCE_DISTANCE_MULT = -0.05, -- per 1 border distance
		
		VASSALIZATION_ACCEPTANCE_PROTECTORATE_MULT = 0.1,		-- multiplied by number of techs potential overlord is ahead in
		VASSALIZATION_ACCEPTANCE_PROTECTORATE_MAX = 20,		
		VASSALIZATION_ACCEPTANCE_NUM_POPS = -0.5,			-- per pop
		VASSALIZATION_ACCEPTANCE_POWER_DIFFERENCE_MIN = 1.5,
		VASSALIZATION_ACCEPTANCE_POWER_DIFFERENCE_MULT = 5,  -- for each 1x over min
		VASSALIZATION_ACCEPTANCE_POWER_DIFFERENCE_MAX = 100,
		VASSALIZATION_ACCEPTANCE_ATTITUDE_ALLIANCE = 10,
		VASSALIZATION_ACCEPTANCE_ATTITUDE_COEXIST = 5, 
		VASSALIZATION_ACCEPTANCE_ATTITUDE_ATTACK = -1000, 
		VASSALIZATION_ACCEPTANCE_OTHER_ATTITUDE = -100,
		VASSALIZATION_ACCEPTANCE_OTHER_THREAT_MULT = 0.2,
		VASSALIZATION_ACCEPTANCE_OTHER_THREAT_MAX = 20,
		VASSALIZATION_ACCEPTANCE_DISTANCE_MULT = -0.5, -- per 1 border distance
		
		OFFER_VASSALIZATION_ACCEPTANCE_ATTITUDE_VASSALIZE = 100,
		OFFER_VASSALIZATION_ACCEPTANCE_OTHER_ATTITUDE = -1000,	
		
		OFFER_TRADE_ACCEPTANCE_ATTITUDE_FACTOR = -0.3, -- trade willingness reduced by this much if don't have an attitude amenable to trade
		OFFER_TRADE_ACCEPTANCE_ATTITUDE = -1000,	-- if attitude is trade = no
		OFFER_TRADE_MIN_RESOURCE_THRESHOLD = 0.8, -- if ai want for an accumulative resource is at least max * this, it won't trade away that resource
		OFFER_TRADE_MIN_UNKNOWN_SYSTEMS_FOR_CHARTS = 10, -- if either side would get knowledge of less systems than this, don't propose trading charts
		
		TRADE_MAX_RESOURCE_PERCENT = 0.3,
		TRADE_MIN_RESOURCE_DELTA = 10,
		TRADE_MIN_RESOURCE_STOCKPILE = 500,
		
		TRADE_RESOURCE_STOCKPILE_UNDER = 0.33,	-- AI will want to trade one resource for another if stockpile is this low (fraction of max storage)
		TRADE_RESOURCE_STOCKPILE_OVER = 0.75,	-- AI will want to trade one resource for another if stockpile is over this (fraction of max storage)
		TRADE_RESOURCE_FRACTION_MIN = 0.1,			-- How much of stockpile AI should offer to trade (min)
		TRADE_RESOURCE_FRACTION_MAX = 0.2,			-- How much of stockpile AI should offer to trade (max)
		
		MIN_WILLINGNESS_TO_OFFER_TRADE = 0.75, -- AIs with a personality whose trade willingness is below this will not offer trades
	
		TRADE_VALUE_RESOURCE_INCOME_BASE = 50,	-- used for calculating resource income effect (lower = more value reduction from higher income)
		TRADE_VALUE_RESOURCE = 2,	-- for minerals and energy (scaled by income & need)
		TRADE_VALUE_RESOURCE_MONTHLY_MULT = 0.8, -- value of monthly resources is multiplied by this compared to lump-sum
		TRADE_VALUE_STRATEGIC_RESOURCE = 1, -- for 1 strategic resource (per year)
		TRADE_VALUE_SYSTEM = 5,
		TRADE_VALUE_COLONY = 0.2, -- Per pop
		TRADE_VALUE_SENSOR_CHARTS = 0.02, -- Per unsurveyed planet
		TRADE_VALUE_SENSOR_CHARTS_MAX = 4,
		TRADE_VALUE_SENSOR_LINK = 0.05, -- Per system within their borders
		TRADE_VALUE_SENSOR_LINK_MAX = 1.0, -- Multiplied by treaty years
		TRADE_VALUE_NON_AGGRESSION_PACT = 1, -- Multiplied by relative power
		TRADE_VALUE_NON_AGGRESSION_PACT_MAX = 5, -- Multiplied by treaty years
		TRADE_VALUE_GUARANTEE = 1, -- Multiplied by relative power
		TRADE_VALUE_GUARANTEE_MAX = 5, -- Multiplied by treaty years
		TRADE_VALUE_SUPPORT_INDEPENDENCE = 1, -- Multiplied by relative power
		TRADE_VALUE_SUPPORT_INDEPENDENCE_MAX = 5, -- Multiplied by treaty years
		TRADE_VALUE_WORMHOLE_ACCESS = 0.1, -- Per system within their borders
		TRADE_VALUE_WORMHOLE_ACCESS_MAX = 1, -- Multiplied by treaty years
		TRADE_VALUE_MIGRATION_ACCESS = 0.1, -- Per planet they own
		TRADE_VALUE_MIGRATION_ACCESS_MAX = 1, -- Multiplied by treaty years
		TRADE_VALUE_RESEARCH_AGREEMENT = 0.1, -- Per tech they have that we don't
		TRADE_VALUE_RESEARCH_AGREEMENT_MAX = 5, -- Multiplied by treaty years			
		-- Above are various acceptance factors for specific actions
		
		NON_MINED_RESOURCES_ENERGY_WANT_FACTOR = 1,	-- If 100% of AI's resources in space are unmined, increase desire for energy by this
		
		MILITARY_STATION_BUDGET_FRACTION = 0.10,	-- AI will spend this fraction of their income on military stations
		SAVINGS_BUDGET_FRACTION = 0.00, 		-- AI will spend this fraction of their income on savings (normally not needed as fleets in dock will result in energy surplus)
		ARMY_BUDGET_FRACTION = 0.05,   			-- AI will spend this fraction of their income on armies
		NAVY_BUDGET_FRACTION = 0.15, 			-- AI will spend this fraction of their income on ships
		STATION_BUDGET_FRACTION = 0.35, 		-- AI will spend this fraction of their income on stations
		BUILDING_BUDGET_FRACTION = 0.25, 		-- AI will spend this fraction of their income on buildings
		ROBOT_BUDGET_FRACTION = 0.10,			-- AI will spend this fraction of their income on robots (transfered to stations & buildings if they don't use robots)
		
		DANGER_BUDGET_FACTOR = 0.1,				-- When there are potential dangers, increase navy budget by this amount
		SHIPSIZE_BUDGET_FACTOR = 0.025,			-- For each ship size unlocked, increase navy budget by this amount
		NAVAL_CAPACITY_BUDGET_MAX = 100,		-- At this naval capacity, AI puts max budget into ships
		PLANET_BUDGET_FACTOR = 0.10,			-- When AI has few planets, it will decrease building/mil station budget by this and put it into colonies/stations instead
		MAX_PLANETS_FOR_BUDGET_FACTOR = 5,		-- At this amount of planets, budget is normalized

		MINERAL_MILITARY_STATION_BUDGET_FRACTION = 0.05, -- AI will spend this fraction of their stored minerals on military stations
		MINERAL_NAVY_BUDGET_FRACTION = 0.15, 	-- AI will spend this fraction of their stored minerals on ships
		MINERAL_STATION_BUDGET_FRACTION = 0.15, -- AI will spend this fraction of their stored minerals on stations (used for spaceport instead when it needs a new spaceport)
		MINERAL_BUILDING_BUDGET_FRACTION = 0.20,-- AI will spend this fraction of their stored minerals on buildings (used for spaceport instead when it needs a new spaceport)
		MINERAL_SPACEPORT_BUDGET_FRACTION = 0.10, -- AI will spend this fraction of their stored minerals on spaceport modules
		MINERAL_COLONY_BUDGET_FRACTION = 0.15,
		MINERAL_ARMY_BUDGET_FRACTION = 0.05,	-- AI will spend this fraction on armies
		MINERAL_TILE_BLOCKER_BUDGET_FRACTION = 0.05,	-- AI will spend this fraction on tile blockers
		MINERAL_ROBOT_BUDGET_FRACTION = 0.05,	-- AI will spend this fraction of their stored minerals on robots (transfered to buildings if they don't use robots)
		
		DISBAND_THRESHOLD = 0.8,			-- If budget does not cover at least this fraction of the navy maintenance, disband ships & stations
		MIN_NAVY_BUDGET = 3,			-- Always add this amount to the navy budget so we can have at least a few ships
		MIN_ARMY_BUDGET = 2,			-- Always add this amount to the army budget so we can have at least a few armies
		
		-- Below values are increased when mineral storage capacity goes up
		ABS_MAX_MINERALS_STORED_MILITARY_STATIONS = 2000,	-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_MILITARY_STATIONS = 1000,	-- Minerals AI will store for mil stations when it needs more
		MIN_MINERALS_STORED_MILITARY_STATIONS = 100,	-- Minerals AI will store for mil stations when it does not need more
		ABS_MAX_MINERALS_STORED_NAVY = 50000,				-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_NAVY = 1000,				-- Minerals AI will store for navy when it needs more
		MIN_MINERALS_STORED_NAVY = 250,				-- Minerals AI will store for navy when it does not need more 
		ABS_MAX_MINERALS_STORED_BUILDINGS = 2000,	-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_BUILDINGS = 1000,		-- Minerals AI will store for buildings when it needs more
		MIN_MINERALS_STORED_BUILDINGS = 250,		-- Minerals AI will store for buildings when it does not need more
		ABS_MAX_MINERALS_STORED_STATIONS = 1000,	-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_STATIONS = 500,			-- Minerals AI will store for stations when it needs more
		MIN_MINERALS_STORED_STATIONS = 100,			-- Minerals AI will store for stations when it does not need more
		ABS_MAX_MINERALS_STORED_SPACEPORT = 1000,		-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_SPACEPORT = 500,		-- Minerals AI will store for spaceport when it needs more
		MIN_MINERALS_STORED_SPACEPORT = 250,		-- Minerals AI will store for spaceport when it does not need more
		ABS_MAX_MINERALS_STORED_COLONIES = 600,	-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_COLONIES = 400,		-- Minerals AI will store for colonies when it needs more
		MIN_MINERALS_STORED_COLONIES = 200,			-- Minerals AI will store for colonies when it does not need more		
		ABS_MAX_MINERALS_STORED_ARMIES = 500,		-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_ARMIES = 300,			-- Minerals AI will store for armies when it needs more
		MIN_MINERALS_STORED_ARMIES = 100,			-- Minerals AI will store for armies when it does not need more		
		ABS_MAX_MINERALS_STORED_TILE_BLOCKERS = 400,				-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_TILE_BLOCKERS = 200,	-- Minerals AI will store for tile blockers when it needs more
		MIN_MINERALS_STORED_TILE_BLOCKERS = 0,		-- Minerals AI will store for tile blockers when it does not need more			
		ABS_MAX_MINERALS_STORED_ROBOTS = 200,				-- Max regardless of cap multiplier
		MAX_MINERALS_STORED_ROBOTS = 100,			-- Minerals AI will store for robots when it needs more
		MIN_MINERALS_STORED_ROBOTS = 0,				-- Minerals AIwill store for robots when it does not need more
		AI_DESIRED_NAVY_MINERALS_AT_WAR = 500,		-- AI wants at least this many minerals for ships while at war
		AI_DESIRED_ARMY_MINERALS_AT_WAR = 100,		-- AI wants at least this many minerals for armies while at war
		MAX_STORED_ENERGY_POST = 500,				-- AI will store maximum this amount for each energy budget post
		-- Above values are increased when mineral storage capacity goes up
		
		MAX_MINERALS_STORED_SECTOR_POST = 1300,		-- Minerals AI will store for each budget post in sectors	
		MAX_MINERALS_STORED_SECTOR_POST_BUILDINGS = 1000,		-- Minerals AI will store for buildings
		MAX_MINERALS_SPENT_ON_NAVY = 0.50,			-- Spend no more than this fraction of mineral income on navy maintenance

		EXPECTED_MINERALS_BASE = 50,				-- AI expects to make this base amount in minerals
		EXPECTED_MINERALS_PER_POP = 0.75,			-- AI expects to make about their num pops x this in minerals
		EXPECTED_TECH_BASE = 10,					-- AI expects to make this base amount in tech
		EXPECTED_TECH_PER_POP = 0.75,				-- AI expects to make about their num pops x this in tech
		EXPECTED_ENERGY_BASE = 20,					-- AI expects to make this base amount in energy
		EXPECTED_ENERGY_PER_POP = 0.75,				-- AI expects to make about their num pops x this in energy
		EXPECTED_ENERGY_SURPLUS = 3,				-- AI wants a surplus of least this amount in monthly energy production (temporary spending such as colonies does not count)
		EXPECTED_SECTOR_ENERGY_SURPLUS = 3,			-- As above, but for sectors
		
		POPS_FOR_HALF_SECTOR_SHARE = 10,			-- At this number of pops, raise sector tax to 50%
		POPS_FOR_HIGH_SECTOR_SHARE = 30,			-- At this number of pops, raise sector tax to 75%
		
		MIN_RESOURCES_TO_BUILD_ORBITAL_STATION = 2,	-- If a planet has less than this amount of minerals/research, don't bother with a mining/research station here
		
		ENERGY_COLONY_BUDGET_FRACTION = 0.3, -- AI will spend this fraction of their energy on new colonies
		ENERGY_FACTIONS_BUDGET_FRACTION = 0.2, -- AI will spend this fraction of their energy on factions
		ENERGY_TILE_BLOCKER_BUDGET_FRACTION = 0.2, -- AI will spend this fraction of their energy on tile blockers
		ENERGY_ROBOT_BUDGET_FRACTION = 0.2, -- AI will spend this fraction of their energy on robots (transfered to colonies if no robots)
		ENERGY_SAVINGS_BUDGET_FRACTION = 0.1, -- AI will spend this fraction of their energy on savings
		
		MAX_ARMY_MAINTENANCE = 20,				-- AI will not spend more than this amount on assault armies
		
		EXPAND_NAVY_LIMIT_FACTOR = 4,			-- If the AI Navy maintenance is this much bigger than the opponents, navy will not be expanded

		CONSTRUCTOR_SHIPS_MUL = 0.04,			-- Number of constructor ships of AI is the number of planets times this value
		THRESHOLD_DISBAND_SHIPS = 3,			-- AI will disband ships if wanted + this value < owned

		COLONIZER_SHIPS_MAX = 1,				-- Maximum number of colonizer ships of AI
		RESEARCH_SHIPS_MAX = 2,					-- Maximum number of research ships of AI
		CONSTRUCTOR_SHIPS_MAX = 4,				-- Maximum number of constructor ships of AI

		LEADER_FRACTION_SCIENTIST = 0.6,		-- Fraction of AI Leaders that should be scientists
		LEADER_FRACTION_ADMIRAL = 0.1,			-- Fraction of admirals
		LEADER_FRACTION_GENERAL = 0.1,			-- Fraction of generals
		LEADER_FRACTION_GOVERNOR = 0.2,			-- Fraction of governor
		LEADER_FRACTION_CHANGE_CAP = 11,		-- Leader cap > this will decrease scientist fraction and increase other

		ABORT_MISSION_LIMIT = 0.50,				-- MilitaryPower fraction below this level will result in AI escaping battle

		PEACE_MIN_WARSCORE_TO_DEMAND = 20,
		PEACE_LENGTH_OF_WAR_MONTHS = 120,			
		PEACE_LENGTH_OF_WAR_UNDER_FACTOR = -0.4,
		PEACE_LENGTH_OF_WAR_OVER_FACTOR = 0.2,
		PEACE_RELATIVE_NAVY_STRENGTH_FACTOR = 20,	
		PEACE_OTHER_WARS_FACTOR = 10,
		PEACE_ANNEXATION_FACTOR = -30,
		PEACE_MAJOR_WAR_FACTOR = -30,
		PEACE_PURIFIER_FACTOR = -30,			-- AI will be less willing to surrender to fanatical purifiers

		MILITARY_STATION_DISTANCE = 40.0,		-- Distance from planet to where military station should be built
		MILITARY_STATION_ANGLE_MAX = 3,			-- A random value between 0 and the angle max is added to the angle of where the military station is built
		MILITARY_STATION_DISTANCE_RANDOM = 4,	-- Random distance from the military station distance where it can be built

		TECH_NEED_MULT_VALUE = 10,				-- Tech need value will multiplied by this value e.g. when certain diplomacy techs are needed
		MIN_WANTED_SCIENTISTS = 4,						-- Below this, AI prioritizes influence spending to get more scientists
				
		INFLUENCE_FRACTION_LEADERS = 0.25,		-- Fraction of AI Influence that goes to electing new leader
		INFLUENCE_FRACTION_EDICTS = 0.10,		-- Fraction of AI Influence that goes to edicts
		INFLUENCE_FRACTION_FACTIONS = 0.20,		-- Fraction of AI Influence that is used on fractions
		INFLUENCE_FRACTION_SAVINGS = 0.25,		-- Fraction of AI influence that is saved
		INFLUENCE_FRACTION_RESETTLEMENT = 0.20,	-- Fraction of AI influence that is saved
		
		INFLUENCE_MAX_STORED_PER_POST = 200,	-- Max stored in any single influence budget post
		
		INFLUENCE_BUDGET_STATIONS = 0.40,		-- Fraction of monthly influence that is used on stations (frontier outposts)
		INFLUENCE_BUDGET_EDICTS = 0.25,			-- Fraction of monthly influence that is used on edicts
		INFLUENCE_BUDGET_SAVINGS = 0.35,		-- Fraction of monthly influence that is saved

		THREAT_TRUCE_MONTHS = 12,				-- AI will not consider the opponent a threat if this many months are left on a truce
		FLEET_BALANCE_THREAT = 0.5,				-- If FleetPower of AI / FleetPower of Enemy is lower than this, AI will consider the country a threat
		ENERGY_MONTHS_FACTOR_WAR = 12,			-- Energy are supposed to last this many months when used to buy new ships in war
		ENEMY_FLEET_POWER_MULT = 1.2,			-- AI will need the the fleet power of the enemy multiplied by this value to become offensive in an offensive war
		ENEMY_NEUTRALS_FLEET_POWER_MULT = 2,	-- AI will need the the fleet power of the enemy multiplied by this value to attack neutrals and space hostiles
		ENEMY_FLEET_POWER_HOME_SYSTEM_MULT = 1.0, -- AI will need the fleet power of the enemy multiplied by this value to attack hostiles in own systems
		PRIO_BASE_FRACTION = 0.80,				-- Prio base fraction, for example if prio is assault, arsenal fraction will be set to this value

		START_WEAPON_TECH_AREA_MULT = 2,		-- Weapons within the same tech area as the start weapon will be weighted (multiplied) by this value when deciding tech strategies
		FRACTION_PERSONALITY_MULT = 2,			-- Techs that apply to a certain personality will be multiplied by this value + tolerance/hierarchical value (interval: -2, +2) divided by this value
		MINERALS_MULT = 8,						-- Mult used to promote building manufactories
		BUILDING_ENERGY_MAX = 100,				-- Used to calc AI want for buildings with energy
		INFLUENCE_MULT = 1,						-- Used to calc AI want for buildings with influence
		BUILDING_PRODUCTION_MAX = 1000,			-- Used to calc AI want for buildings with production points
		POP_FOOD_MIN = 3,						-- AI should always prioritize to get more food when planet food tot is below this value

		WORMHOLE_STATION_OFFSET = 150.0,		-- Used to place wormhole stations in system

		CRISIS_FLEET_SIZE_LIMIT_LOWER = 130,	-- Swarm fleet will aim for this size before attacking targets
		CRISIS_NAVY_SIZE_LIMIT = 130,			-- Swarm fleet will aim for this size before attacking targets
		CRISIS_ARMY_LIMIT = 100,				-- Swarms will not build more armies if it has this many armies already

		SECTOR_SYSTEM_CAP_MIN = 2,				-- AI sectors will have minimum these many colonized systems in each sector before creating new sectors

		SECTOR_FOCUS_EFFECT = 100,				-- Resources designated as the focus of a sector are valued this much more
		SECTOR_IGNORE_TILE_RESOURCE = 0,		-- Should sectors ignore which resources are on the tile when building?
		
		SECTOR_STATION_BUDGET_FRACTION = 0.30,	-- Fraction of budget going to stations
		SECTOR_BUILDING_BUDGET_FRACTION = 0.40, -- Fraction of budget going to buildings
		SECTOR_SPACEPORT_BUDGET_FRACTION = 0.10,-- Fraction of budget going to spaceports
		SECTOR_ARMY_BUDGET_FRACTION = 0.05,		-- Fraction of budget going to armies
		SECTOR_ROBOT_BUDGET_FRACTION = 0.15,	-- AI will spend this fraction of their stored minerals on robots (transfered to buildings if they don't use robots)
		SECTOR_MINERALS_NEED_THRESHOLD = 5,		-- Minerals needed per month before starting to build other buildings

		SECTOR_BUILDING_MAINT_BUDGET_FRACTION = 0.40, -- Fraction of maintenance budget going to buildings
		SECTOR_STATION_MAINT_BUDGET_FRACTION = 0.40,-- Fraction of maintenance budget going to spaceports and stations
		SECTOR_ARMY_MAINT_BUDGET_FRACTION = 0.10,	-- Fraction of maintenance budget going to spaceports and stations
		SECTOR_ROBOT_MAINT_BUDGET_FRACTION = 0.10,	-- AI will spend this fraction of their budget on robots (transfered to buildings if they don't use robots)

		ATTITUDE_CHANGE_BUFFER = 0,					-- Don't change attitude if weight diff is less than this

		AI_COMMUNICATIONS_RANDOM_VALUE = 60,		-- AI communications days will vary with +- these many days
		
		OUTPOST_STATION_RESOURCES_BUILD = 9,			-- AI should build outpost station if system has more than this many resources
		OUTPOST_STATION_RESOURCES_NEIGHBORS_BUILD = 20, -- AI should build oupost station if neighboring systems have these many resources
		OUTPOST_STATION_DISTANCE_MAX = 2500,		-- AI consideres station in neighboring system if square distance is higher than this value from a colony
		OUTPOST_STATION_RANGE = 400,				-- AI consider outpost station to be able to extrude border about this far
		
		MAX_CAPITAL_UPGRADE_BEFORE_PLANET_FULL = 1,	-- AI will not upgrade capital above this level before the planet is full (in pops)
		
		TRANSPORT_FLEET_SIZE = 11,					-- AI will have transport fleets of this size + 1
		ARSENAL_FLEET_SIZE = 200,					-- AI will have arsenal fleets of half this size
		
		POP_RESETTLEMENT_PRIO = 5.0,				-- AI Will prio resettling to achieve these many pops in each colony before anything else
		
		DISTANCE_STARS_RESEARCH = 10,				-- AI will assume this is the average dist between stars
		AUTO_EXPLORE_ATTRACTION_SCORE = 200,		-- Attraction score to auto explore a system will descrease by this much if system is owned by you or has a planet owned by you
		
		MAX_COLONIZATION_RANGE = 150,				-- Range from borders AI will colonize planet (influence cost)
		OPTIMAL_OUTPOST_DISTANCE = 3000,			-- Range from borders ED will build outpost (square distance)
		ED_MIL_STATIONS_IN_SYSTEMS = 4,				-- Fraction of systems within borders that will have military stations in it for ED
		
		NO_WARS_FLAG = "ai_no_wars",
		NO_LEAVE_FED_FLAG = "ai_no_leave_fed",
	},

}
