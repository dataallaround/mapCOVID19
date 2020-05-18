

getDataCovid_IT <- function(date = NULL, FromTo = NULL, by = c("day", "week", "month"),
                            level = c("regioni", "province"), download_dir = NULL)
{

  library(stringr)
  library(httr)

  level <- match.arg(level, choices = eval(formals(getDataCovid_IT)$level))

  if(is.null(date) & is.null(FromTo)){

    url <- paste("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/", sep = "")
    list <- GET("https://api.github.com/repos/dataallaround/mapCOVID19/git/trees/master?recursive=1")
    stop_for_status(list)
    file <- unlist(lapply(content(list)$tree, "[", "path"), use.names = F)
    file <- grep(paste("IT/RData/",level, "/ita_",level, sep = ""), file, value = TRUE, fixed = TRUE)


    ndt <- length(file)
    temp <- vector("list", ndt)

    if(!is.null(download_dir))
    {
      for(i in 1:ndt)
      {
        file_url <- paste(url,file[i],sep = "")
        download.file(url, download_dir)
        temp[[i]] <- get(load(paste(download_dir,file[i],sep = "/")))[,]
      }

    }else{

      for(i in 1:ndt)
      {
        file_url <- paste(url,file[i],sep = "")
        temp[[i]] <- get(load(url(file_url)))
      }


    }
  }else{

    by <- match.arg(by, choices = eval(formals(getDataCovid_IT)$by))
    url <- paste("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/IT/RData/", level, sep = "")

    if(!is.null(FromTo)){

      from <- as.Date(FromTo[1])
      to <- as.Date(FromTo[2])

      date <- seq.Date(from = from, to = to, by = by)

    }

    date <- str_replace_all(string = date, pattern = "-", replacement = "")
    ndt <- length(date)


    temp <- vector("list", ndt)

    if(!is.null(download_dir))
    {
      for(i in 1:ndt)
      {
        file <- paste("ita_",level,"_",date[i], sep = "")
        file_url <- paste(url,file,sep = "/")
        download.file(url, download_dir)
        temp[[i]] <- get(load(paste(download_dir,file,sep = "/")))
      }

    }else{

      for(i in 1:ndt)
      {
        file <- paste("ita_",level,"_", date[i], ".RData",sep = "")
        file_url <- paste(url,file,sep = "/")
        temp[[i]] <- get(load(url(file_url)))
      }


    }


  }


  out <- do.call(rbind.data.frame,temp)

  return(out)

}
