# Download and load eSet_HIIT data
url <- "https://github.com/isglobal-brge/dataSportomics/releases/download/v0.1.0/eSet_HIIT.Rdata"
cache_dir <- file.path(tempdir(), "dataSportomics")

if (!dir.exists(cache_dir)) {
  dir.create(cache_dir, recursive = TRUE)
}

local_file <- file.path(cache_dir, "eSet_HIIT.Rdata")

if (!file.exists(local_file)) {
  message("Downloading eSet_HIIT data...")
  download.file(url, local_file, mode = "wb", quiet = FALSE)
  message("Download complete.")
} else {
  message("Loading cached data from: ", local_file)
}

load(local_file, envir = environment())
eSet_HIIT <- eset
