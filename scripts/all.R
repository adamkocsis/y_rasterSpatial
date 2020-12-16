## geographic data in a matrix
data(volcano)

## geographic data in a matrix
?volcano

ncol(volcano)
nrow(volcano)

# Contour plot
contour(volcano)

## even colorful
filled.contour(volcano, col=terrain.colors(25))

# install.packages("raster")
library(raster)

# Set working directory
setwd("/media/adam/work/Dropbox/Teaching/FAU/ComputersInGeoscience/2020/y_rasterSpatial")

etopo <- raster("data/etopo/etopo.tif")

etopo

str(etopo)

class(etopo)

dim(etopo)

nrow(etopo)

ncol(etopo)

length(etopo)

# The coordinate-reference system
crs(etopo)

extent(etopo)
res(etopo)

plot(etopo)

plot(etopo, col=heat.colors(255))

plot(etopo, col=heat.colors(255), xlim=c(-80, 10), ylim=c(0, 50))

vals <- values(etopo)

# copy the raster structure
r <- etopo

# fill the values with data
values(r) <- 1:length(r)

# plot it 
plot(r)

ex <- extent(c(0, 40, -10, 30))
cropped <- crop(etopo, ex)

# plot
plot(cropped)

r <- etopo
res(r) <- 5
etopoCoarse <- resample(etopo, r)

# plot the coarse resolution thing
plot(etopoCoarse)

temp <- raster("data/wc10/bio1.bil")

plot(temp, col=rainbow(255))

# one coordinate pair, Erlangen
# this has to be an x-y matrix!! - Implying the same CRS
coord <- matrix(c(25, 10), nrow=1)

# extract the value
extract(etopo, coord)

tempMoll <- projectRaster(temp, crs=CRS("+proj=moll"))

# The show method
tempMoll

# plotting
plot(tempMoll, col=rainbow(255))

library(rgdal)
wb <- readOGR("data/world_borders/wb.shx")

plot(etopo)
plot(wb, add=T)

uk <- wb["206", ]

uktopo <- mask(etopo, uk)

plot(uktopo)

plot(uk)
plot(uktopo, add=T)
plot(uk, add=T)
