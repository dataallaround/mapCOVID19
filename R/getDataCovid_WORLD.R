

getDataCovid_WORLD <- function(date, country = NULL, country_id = NULL,
                               country_iso3 = NULL, download_dir = NULL)
{

  library(stringr)

  level <- match.arg(level, choices = eval(formals(getDataCovidUS)$level))
  date <- str_replace_all(string = date, pattern = "-", replacement = "")
  ndt <- length(date)

  url <- paste("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/WORLD/RData", sep = "")

  temp <- vector("list", ndt)

  if(!is.null(download_dir))
  {
    for(i in 1:ndt)
    {
      file <- paste("world_",date[i], sep = "")
      file_url <- paste(url,file,sep = "/")
      download.file(url, download_dir)
      temp[[i]] <- get(load(paste(download_dir,file,sep = "/")))
    }

  }else{

    for(i in 1:ndt)
    {
      file <- paste("world_", date[i], ".RData",sep = "")
      file_url <- paste(url,file,sep = "/")
      temp[[i]] <- get(load(url(file_url)))
    }


  }

  out <- do.call(rbind,temp)

  if(!is.null(country))
  {
    out <- out[out$country%in%country,]
  }

  if(!is.null(country_id))
  {
    out <- out[out$country_id%in%country_id,]
  }

  if(!is.null(country_iso3))
  {
    out <- out[out$iso3%in%country_iso3,]
  }



  return(out)

}
