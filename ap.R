setwd("~/Documentos/ap/")
library("leaflet")
library("sp")
library(htmlwidgets)

m <- leaflet() %>% 
  addProviderTiles(provider = "Stamen.Terrain") %>% 
  setView(-46, -23, zoom = 4) %>%
  addWMSTiles("http://apps.ecmwf.int/wms/", 
              layers = "composition_bbaod550", 
              options = WMSTileOptions(token = "public",
                                       srs = "EPSG:4326",
                                       format = "image/png", 
                                       transparent = TRUE,
                                       opacity = 0.7))
saveWidget(m, file="~/Documentos/ap/index.html")

ti <- paste("2018-01-01", c("00:00", "06:00", "12:00", "18:00"))
tii <- as.POSIXct(ti, tz = "America/Sao_Paulo")
tii_gmt <- tii
attr(tii_gmt, "tzone") <- "GMT"
