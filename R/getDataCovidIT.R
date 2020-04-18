

getDataCovidIT <- function(date, level = c("regioni", "province"), download_dir = NULL)
{

  library(stringr)

  level <- match.arg(level, choices = eval(formals(getDataCovidIT)$level))
  date <- str_replace_all(string = date, pattern = "-", replacement = "")
  ndt <- length(date)

  url <- paste("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/IT/RData/", level, sep = "")

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

  out <- do.call(rbind,temp)

  return(out)

}
