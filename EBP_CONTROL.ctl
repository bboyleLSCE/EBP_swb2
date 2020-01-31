#
#	EAST BAY PLAIN SOIL-WATER-BALANCE
#	Base projection: NAD 1983 California (Teale) Albers (US Feet)
#	(comment characters: !#$%*()-[])
#
#-------------------------------------------------------------------------------
#
#
# (0) PROJECT GRID DEFINITION
#-------------------------------------------------------------------------------
#	nx	ny	xll			yll			resolution
#-------------------------------------------------------------------------------
GRID	229	293	-699542.60804304	8979718.0271142		500.
BASE_PROJECTION_DEFINITION +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
#
#
# (1) MODULE SPECIFICATION
#-------------------------------------------------------------------------------
#
INTERCEPTION_METHOD			BUCKET
EVAPOTRANSPIRATION_METHOD		MONTHLY_GRID		#HARGREAVES
RUNOFF_METHOD				CURVE_NUMBER
SOIL_MOISTURE_METHOD			FAO-56_TWO_STAGE
PRECIPITATION_METHOD			GRIDDED
FOG_METHOD				NONE
FLOW_ROUTING_METHOD			D8
IRRIGATION_METHOD			FAO-56
ROOTING_DEPTH_METHOD			DYNAMIC
CROP_COEFFICIENT_METHOD			FAO-56
DIRECT_RECHARGE_METHOD			NONE
SOIL_STORAGE_MAX_METHOD			GRIDDED
#
#AVAILABLE_WATER_CAPACITY_METHOD	GRIDDED
#PERCENT_IMPERVIOUS_COVER		GRIDDED
#POTENTIAL_EVAPOTRANSPIRATION_METHOD	GRIDDED
#
#
# (2) INITIAL CONDITIONS
#-------------------------------------------------------------------------------
#
INITIAL_PERCENT_SOIL_MOISTURE		CONSTANT 100.0		#estimate
INITIAL_SNOW_COVER_STORAGE		CONSTANT 0.0
#
#
# (3) DAILY WEATHER DATA
#-------------------------------------------------------------------------------
#
# precipitation: converting mm to inches
PRECIPITATION NETCDF input/precip/daymet_v3_prcp_%y_na.nc4
PRECIPITATION_GRID_PROJECTION_DEFINITION +proj=lcc +lat_1=25.0 +lat_2=60.0 +lat_0=42.5 +lon_0=-100.0 +x_0=0.0 +y_0=0.0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs 
PRECIPITATION_NETCDF_Z_VAR		prcp
PRECIPITATION_SCALE_FACTOR		0.03937008
PRECIPITATION_MISSING_VALUES_CODE	-9999.0 
PRECIPITATION_MISSING_VALUES_OPERATOR	<= 
PRECIPITATION_MISSING_VALUES_ACTION	zero
#
# maximum air temperature: converting degrees Celsius to degrees Fahrenheit
TMAX NETCDF input/tmax/daymet_v3_tmax_%y_na.nc4
TMAX_GRID_PROJECTION_DEFINITION +proj=lcc +lat_1=25.0 +lat_2=60.0 +lat_0=42.5 +lon_0=-100.0 +x_0=0.0 +y_0=0.0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs
TMAX_SCALE_FACTOR		1.8
TMAX_ADD_OFFSET			32.0
TMAX_MISSING_VALUES_CODE	-9999.00 
TMAX_MISSING_VALUES_OPERATOR	<= 
TMAX_MISSING_VALUES_ACTION	mean
#
# minimum air temperature: converting degrees Celsius to degrees Fahrenheit
TMIN NETCDF input/tmin/daymet_v3_tmin_%y_na.nc4
TMIN_GRID_PROJECTION_DEFINITION +proj=lcc +lat_1=25.0 +lat_2=60.0 +lat_0=42.5 +lon_0=-100.0 +x_0=0.0 +y_0=0.0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs
TMIN_SCALE_FACTOR		1.8
TMIN_ADD_OFFSET			32.0
TMIN_MISSING_VALUES_CODE	-9999.00 
TMIN_MISSING_VALUES_OPERATOR	<= 
TMIN_MISSING_VALUES_ACTION	mean
#
#
# (4) "STANDARD" INPUT GIS GRIDS
#-------------------------------------------------------------------------------
#
FLOW_DIRECTION			ARC_GRID	D8_FLOW_DIRECTION.asc
FLOW_DIRECTION_PROJECTION_DEFINITION  +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
#
HYDROLOGIC_SOILS_GROUP		ARC_GRID	HYDROLOGIC_SOILS_GROUP.asc
HYDROLOGIC_SOILS_GROUP_PROJECTION_DEFINITION +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
#
LAND_USE			ARC_GRID	LAND_USE.asc
LAND_USE_PROJECTION_DEFINITION +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
#
SOIL_STORAGE_MAX		ARC_GRID	MAX_SOIL_WATER_CAPACITY.asc
SOIL_STORAGE_MAX_PROJECTION_DEFINITION +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
SOIL_STORAGE_MAX_MISSING_VALUES_CODE -9999.00
SOIL_STORAGE_MAX_MISSING_VALUES_OPERATOR <=
SOIL_STORAGE_MAX_MISSING_VALUES_ACTION mean
#
##PERCENT_IMPERVIOUS_COVER	ARC_GRID	PERCENT_IMPERVIOUS_COVER.asc
##PERCENT_IMPERVIOUS_COVER_DEFINITION +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
#
REFERENCE_ET0			ARC_GRID	REFERENCE_ET0_%0m_%b.asc
REFERENCE_ET0_DEFINITION +proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0 +y_0=-4000000 +ellps=GRS80 +datum=NAD83 +units=us-ft +no_defs
#
#
# (5) Specify location and names for all lookup tables
#-------------------------------------------------------------------------------
#
LAND_USE_LOOKUP_TABLE std_input/LAND_USE_lookup.txt 
#
#
# (6) START AND END DATES
#------------------------------------------------------------------------------- 
#
START_DATE 10/01/1988
END_DATE 09/30/2015