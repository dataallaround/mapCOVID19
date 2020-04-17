

getDataCovidIT <- function(data, level = c("regioni", "province"), download_dir = NULL)
{

require()

  level <- match.arg(level, choices = eval(formals(getDataCovid)$level))
  ndt <- length(data)

  url <- paste("https://raw.githubusercontent.com/dataallaround/mapCOVID19/master/RData/", level, sep = "")

  temp <- vector(ndt, "list")

  if(!is.null(download_dir))
  {
    for(i in 1:ndt)
    {
    file <- paste("ita_",level,"_",data[i], sep = "")
    file_url <- paste(url,file,sep = "/")
    download.file(url, download_dir)
    temp[[i]] <- get(load(paste(download_dir,file,sep = "/")))
    }

  }else{

    for(i in 1:ndt)
    {
      file <- paste("ita_",level,"_", data[i], sep = "")
      file_url <- paste(url,file,sep = "/")
      temp[[i]] <- load(file_url)
    }


  }

  out <- do.call(rbind,temp)

  return(out)

}
