library(ggplot2)
library(marmap)
library(rgdal)
library(raster)

bath <- readGEBCO.bathy("GEBCO_2019_-65.3544_61.5383_-41.7087_44.1818.nc")  # your GEBCO sourced netcdf
bath.f <- fortify.bathy(bath)

coast <- readOGR("gshhg-shp-2.3.7/GSHHS_shp/f/GSHHS_f_L1.shp") # your NOAA sourced coastline shapefiles 
coast.trim <- crop(coast, extent(-57.5, -47.5, 45, 55))  # trim this down to a reasonable bounding box before plotting

brk <- c(-100,-250,-500)   #define bathymetry breaks

ggplot(your.dat, aes(x=Lon, y=Lat)) +
    
    geom_contour(data = bath.f,                       #bathymetry - plot this as the bottom layer... add coast and stations after
                 aes(x=x, y=y, z=z),
                 breaks=brk,
                 size=c(0.3),
                 colour="lightsteelblue2") +

    geom_polygon(data= coast.trim,                      #coast - high resolution coastline
                 aes(x=long, 
                     y=lat,
                     group=group),
                 fill= "navajowhite1", 
                 colour ="dodgerblue4",
                 inherit.aes = F) 

