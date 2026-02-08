# Download and load se_EPO data
url <- "https://github.com/isglobal-brge/dataSportomics/releases/download/se_EPO/se_EPO.RData"
cache_dir <- file.path(tempdir(), "dataSportomics")

if (!dir.exists(cache_dir)) {
  dir.create(cache_dir, recursive = TRUE)
}

local_file <- file.path(cache_dir, "se_EPO.RData")

if (!file.exists(local_file)) {
  message("Downloading se_EPO data...")
  download.file(url, local_file, mode = "wb", quiet = FALSE)
  message("Download complete.")
} else {
  message("Loading cached data from: ", local_file)
}

se_EPO <- readRDS(local_file)
