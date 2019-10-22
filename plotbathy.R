library(ggplot2)
library(marmap)
library(raster)

bath <- readGEBCO.bathy("G:\\DFO Capelin 2019\\GIS\\GEBCO_2019_-65.3544_61.5383_-41.7087_44.1818.nc")
bath.f <- fortify.bathy(bath)

brk <- c(-100,-250,-500)   #define bathymetry breaks

ggplot(you.dat, aes(x=Lon, y=Lat)) +
    
    geom_contour(data = bath.f,                       #bathymetry - plot this as the bottom layer... add coast and stations after
                 aes(x=x, y=y, z=z),
                 breaks=brk,
                 size=c(0.3),
                 colour="lightsteelblue2") 
