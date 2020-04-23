

# COVID-19 Datasets with Coordinates

[![DOI](https://zenodo.org/badge/256482318.svg)](https://zenodo.org/badge/latestdoi/256482318)


This repository aims to simplify the visualisation of the COVID-19 datasets. Data and geometries are provided in the same file and with different formats to immediately plot the data in R or other software for geospatial data.

The `R` folder provides functions to directly download the data in `R`, for _Italy_, and _USA_.

For more details on the functions and packages used look at the references section.

Table of contents
=================

  * [Download in R](#download-in-r)
    + [Italy](#italy)
    + [USA](#usa)
    + [WORLD](#world)
  * [Static map examples in R](#static-map-examples-in-r)
  * [Dynamic map examples in R](#dynamic-map-examples-in-r)
  * [Sources](#sources)
  * [References](#references)
  * [Citation](#citation)


## Download in R

| functions | description|
------------|------------|
| `getDataCovid_IT()`| retrives data from this repository for the italian cases |
|`getDataCovid_US()`| retrives data from this repository for the United States of America cases |
------------------------------------------

### Italy

Data can be downloaded first loaded the R function `getDataCovid_IT()` available in the `R` folder of this repo:


```r
library(devtools)
source_url("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/R/getDataCovid_IT.R")
```

`getDataCovid_IT()` requires the date in the format `yyyy-mm-dd`, and the geographical level, "regioni" or "province":


```r
dt = getDataCovid_IT(date = "2020-04-17", level = "regioni")
names(dt)
```

```
##  [1] "date"                       "ripartizione"               "regione"                   
##  [4] "hospitalized"               "ventilation"                "hospitalized_total"        
##  [7] "confinement"                "current_positive"           "variation_current_positive"
## [10] "new_positive_total"         "recovered"                  "death"                     
## [13] "positive"                   "tests"                      "geometry"
```

for "regions", and for "province":


```r
dt = getDataCovid_IT(date = "2020-04-17", level = "province")
names(dt)
```

```
## [1] "regione"      "provincia"    "date"         "ripartizione" "positive"     "geometry"
```

Multiple `date` can be loaded and aggregate in a single file:


```r
dt = getDataCovid_IT(date = c("2020-04-17","2020-04-16"), level = "regioni")
names(dt)
```

```
##  [1] "date"                       "ripartizione"               "regione"                   
##  [4] "hospitalized"               "ventilation"                "hospitalized_total"        
##  [7] "confinement"                "current_positive"           "variation_current_positive"
## [10] "new_positive_total"         "recovered"                  "death"                     
## [13] "positive"                   "tests"                      "geometry"
```

Data can be also downloaded using "download_dir" in `getDataCovid_IT()` function, indicating the destination directory. 

### USA

Data can be downloaded first loaded the R function `getDataCovid_US()` available in the `R` folder of this repo:


```r
library(devtools)
source_url("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/R/getDataCovid_US.R")
```

`getDataCovid_US()` requires the date in the format `yyyy-mm-dd`, for only the states of US:


```r
dtUS = getDataCovid_US(date = "2020-04-17")
names(dtUS)
```

```
##  [1] "abbr"                 "state"                "date"                 "Confirmed"           
##  [5] "Deaths"               "Recovered"            "Active"               "FIPS"                
##  [9] "Incident_Rate"        "People_Tested"        "People_Hospitalized"  "Mortality_Rate"      
## [13] "UID"                  "ISO3"                 "Testing_Rate"         "Hospitalization_Rate"
## [17] "geometry"
```

Multiple `date` can be loaded and aggregate in a single file:


```r
dtUS = getDataCovid_US(date = c("2020-04-17","2020-04-16"))
names(dtUS)
```

```
##  [1] "abbr"                 "state"                "date"                 "Confirmed"           
##  [5] "Deaths"               "Recovered"            "Active"               "FIPS"                
##  [9] "Incident_Rate"        "People_Tested"        "People_Hospitalized"  "Mortality_Rate"      
## [13] "UID"                  "ISO3"                 "Testing_Rate"         "Hospitalization_Rate"
## [17] "geometry"
```


Data can be also downloaded using "download_dir" in `getDataCovid_US()` function, indicating the destination directory. 


### WORLD

Data can be downloaded first loaded the R function `getDataCovid_WORLD()` available in the `R` folder of this repo:


```r
library(devtools)
source_url("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/R/getDataCovid_WORLD.R")
```

`getDataCovid_WORLD()` requires the date in the format `yyyy-mm-dd`, for only the states of US:


```r
dtWD = getDataCovid_WORLD(date = "2020-04-17")
names(dtWD)
```

```
##  [1] "date"                 "country"              "country_id"           "iso3"                
##  [5] "region"               "deaths"               "cumulative_deaths"    "confirmed"           
##  [9] "cumulative_confirmed" "geometry"
```

Multiple `date` can be loaded and aggregate in a single file:


```r
dtWD = getDataCovid_WORLD(date = c("2020-04-17","2020-04-16"))
names(dtWD)
```

```
##  [1] "date"                 "country"              "country_id"           "iso3"                
##  [5] "region"               "deaths"               "cumulative_deaths"    "confirmed"           
##  [9] "cumulative_confirmed" "geometry"
```


Specific countries can be download used `country` for the country name, `country_id` for iso2 country id, and `country_iso3` for iso3 country id.


```r
dtWD = getDataCovid_WORLD(date = "2020-04-19", country =  "Italy")
names(dtWD)
```

```
##  [1] "date"                 "country"              "country_id"           "iso3"                
##  [5] "region"               "deaths"               "cumulative_deaths"    "confirmed"           
##  [9] "cumulative_confirmed" "geometry"
```


```r
  dtWD = getDataCovid_WORLD(date = c("2020-04-18","2020-04-19"), country_iso3 =  c("ITA", "ESP"))
  names(dtWD)
```

```
##  [1] "date"                 "country"              "country_id"           "iso3"                
##  [5] "region"               "deaths"               "cumulative_deaths"    "confirmed"           
##  [9] "cumulative_confirmed" "geometry"
```

Data can be also downloaded using "download_dir" in `getDataCovid_US()` function, indicating the destination directory. 

## Static map examples in R

Some examples to map the data in R software.


```r
library(sf)
library(tmap)
library(cartography)
suppressMessages(tmap_mode("plot"))

dt = getDataCovid_IT(date = "2020-04-17", level = "regioni")
dtUS = getDataCovid_US(date = "2020-04-17")
dtWD = getDataCovid_WORLD(date = "2020-04-19")
```



```r
tm_shape(dt) + tm_borders() + tm_fill("positive") + tm_layout(frame = FALSE)
```

<img src="README_files/figure-html/unnamed-chunk-14-1.png" width="672" style="display: block; margin: auto;" />


```r
library("grid")
alaska <- tm_shape(dtUS[dtUS$state=="Alaska",], projection = 3338) + tm_borders() + tm_layout("Alaska", legend.show = FALSE, bg.color = NA, title.size = 0.8, frame = FALSE) + tm_fill("Confirmed", n = 10) 

hawaii <- tm_shape(dtUS[dtUS$state=="Hawaii",], projection = 3759) + tm_borders() +    tm_layout("Hawaii",legend.show = FALSE, bg.color=NA, title.position = c("LEFT", "BOTTOM"), title.size = 0.8, frame=FALSE) + tm_fill("Confirmed", n = 10) 

alk <- viewport(x = 0.15, y = 0.15, width = 0.3, height = 0.3)
haw <- viewport(x = 0.4, y = 0.1, width = 0.2, height = 0.1)

tm_shape(dtUS[!(dtUS$state %in% c("Alaska", "Hawaii")),],  projection=2163) + tm_borders() + tm_fill("Confirmed", n = 10) +  tm_layout(legend.position = NULL, frame = FALSE, inner.margins = c(0.1, 0.1, 0.05, 0.05), legend.show = FALSE)
print(alaska, vp = alk)
print(hawaii, vp = haw)
```

<img src="README_files/figure-html/unnamed-chunk-15-1.png" width="672" style="display: block; margin: auto;" />


```r
tm_shape(dtWD) + tm_borders() + tm_fill("deaths", n = 10) + tm_layout(frame = FALSE, legend.show = TRUE)
```

<img src="README_files/figure-html/unnamed-chunk-16-1.png" width="672" style="display: block; margin: auto;" />



```r
tm_shape(dt) + tm_borders() + tm_fill("positive", n = 10) + tm_facets("regione")
```

<img src="README_files/figure-html/unnamed-chunk-17-1.png" width="672" style="display: block; margin: auto;" />


For different date we can plot as follows:


```r
dt = getDataCovid_IT(date = c("2020-04-17","2020-04-16","2020-04-15"), level = "regioni")
tm_shape(dt) + tm_borders() + tm_fill("positive") + tm_facets("date")
```

<img src="README_files/figure-html/unnamed-chunk-18-1.png" width="672" style="display: block; margin: auto;" />



```r
dtWD = getDataCovid_WORLD(date = c("2020-04-01","2020-04-19"), country_iso3 =  c("ITA", "ESP"))
tm_shape(dtWD) + tm_borders() + tm_fill("deaths") + tm_facets(c("date","country"))
```

<img src="README_files/figure-html/unnamed-chunk-19-1.png" width="672" style="display: block; margin: auto;" />

Starting from `nuts3` (`regions`), we can aggregate, for example, by `nuts1` (`ripartizione`)


```r
dt = getDataCovid_IT(date = c("2020-04-17"), level = "province")
dt_aggr <- aggregate(dt[,"positive"], by = list( group = dt[,"ripartizione", drop = TRUE]), FUN = sum)
tm_shape(dt_aggr) + tm_borders() + tm_fill("positive")
```

<img src="README_files/figure-html/unnamed-chunk-20-1.png" width="672" style="display: block; margin: auto;" />

```r
tm_shape(dt_aggr) + tm_borders() + tm_fill("positive") + tm_facets("group")
```

<img src="README_files/figure-html/unnamed-chunk-20-2.png" width="672" style="display: block; margin: auto;" />

## Dynamic map examples in R


```r
library(tmap)
library(mapview)
suppressMessages(tmap_mode("view"))

dt = getDataCovid_IT(date = "2020-04-17", level = "regioni")
dtUS = getDataCovid_US(date = "2020-04-17")
```



```r
tm_shape(dt) + tm_borders() + tm_fill("positive")
```


```r
tm_shape(dtUS) + tm_borders() + tm_fill("Confirmed")
```


```r
mapview(dt, zcol = "positive")
```


```r
mapview(dtUS, zcol = "Confirmed")
```

## Sources

- [`Dipartimento della Protezione Civile Italiana`](https://github.com/pcm-dpc/COVID-19)
- [`ISTAT`](https://www.istat.it/it/archivio/222527)
- [`United States Census Bureau`](https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html)
- [`Center For Systems Science and Engineering at JHU`](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data)
- [`World Health Organization`](https://www.who.int)
- [`Eurostat Country GISCO`](https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units/countries)

## References

- <a href="https://cran.r-project.org/web/packages/sf/index.html">`sf`</a>
  - Pebesma, E., 2018. Simple Features for R: Standardized Support for Spatial Vector Data. _The R
    Journal_, 10 (1), 439-446, https://doi.org/10.32614/RJ-2018-009
  - https://r-spatial.github.io/sf/index.html  

- <a href="https://cloud.r-project.org/web/packages/mapview/index.html">`mapview`</a>
  - Tim Appelhans, Florian Detsch, Christoph Reudenbach and Stefan Woellauer (2019). mapview:
    Interactive Viewing of Spatial Data in R. R package version 2.7.0.
    https://CRAN.R-project.org/package=mapview
  - https://r-spatial.github.io/mapview/  

- <a href="https://cloud.r-project.org/web/packages/tmap/index.html">`tmap`</a>
  - Tennekes M (2018). “tmap: Thematic Maps in R.” _Journal of Statistical Software_, *84*(6), 1-39.
    doi: 10.18637/jss.v084.i06 (URL: https://doi.org/10.18637/jss.v084.i06).
  - https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html
  
## Citation

Serafini A. (2020). dataallaround/mapCOVID19: mapCOVID19 (Version v1.0) [Data set]. Zenodo. http://doi.org/10.5281/zenodo.3763033

```
@dataset{alessio_2020_3763033,
  author       = {Alessio},
  title        = {dataallaround/mapCOVID19: mapCOVID19},
  month        = apr,
  year         = 2020,
  publisher    = {Zenodo},
  version      = {v1.0},
  doi          = {10.5281/zenodo.3763033},
  url          = {https://doi.org/10.5281/zenodo.3763033}
}

```
