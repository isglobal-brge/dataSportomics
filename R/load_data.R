#' Load eSet_HIIT methylation data
#'
#' Downloads and loads the DNA methylation ExpressionSet from the HIIT study.
#' Data is cached locally after first download.
#'
#' @param cache_dir Directory to cache downloaded data. Defaults to
#'   `rappdirs::user_cache_dir("dataSportomics")` or a temp directory.
#' @param force_download If TRUE, re-download even if cached file exists.
#'
#' @return An ExpressionSet object with DNA methylation data (Illumina EPIC array,
#'   78 samples from HIIT study).
#'
#' @examples
#' \dontrun{
#' eset <- load_eSet_HIIT()
#' eset
#' }
#'
#' @export
load_eSet_HIIT <- function(cache_dir = NULL, force_download = FALSE) {


  url <- "https://github.com/isglobal-brge/dataSportomics/releases/download/v0.1.0/eSet_HIIT.Rdata"


  if (is.null(cache_dir)) {
    cache_dir <- file.path(tempdir(), "dataSportomics")
  }

  if (!dir.exists(cache_dir)) {
    dir.create(cache_dir, recursive = TRUE)
  }

  local_file <- file.path(cache_dir, "eSet_HIIT.Rdata")


  if (!file.exists(local_file) || force_download) {
    message("Downloading eSet_HIIT data...")
    download.file(url, local_file, mode = "wb", quiet = FALSE)
    message("Download complete.")
  } else {
    message("Loading cached data from: ", local_file)
  }


  env <- new.env()
  load(local_file, envir = env)


  obj_names <- ls(env)
  if (length(obj_names) == 1) {
    return(env[[obj_names[1]]])
  } else {
    return(as.list(env))
  }
}


#' Load se_EPO transcriptomics data
#'
#' Downloads and loads the RNA-seq SummarizedExperiment from the EPO study.
#' Data is cached locally after first download.
#'
#' @param cache_dir Directory to cache downloaded data.
#' @param force_download If TRUE, re-download even if cached file exists.
#'
#' @return A SummarizedExperiment object with RNA-seq data (16,738 genes,
#'   50 samples from EPO study with Base/EPO/Post timepoints).
#'
#' @examples
#' \dontrun{
#' se <- load_se_EPO()
#' se
#' }
#'
#' @export
load_se_EPO <- function(cache_dir = NULL, force_download = FALSE) {

  url <- "https://github.com/isglobal-brge/dataSportomics/releases/download/se_EPO/se_EPO.RData"

  if (is.null(cache_dir)) {
    cache_dir <- file.path(tempdir(), "dataSportomics")
  }

  if (!dir.exists(cache_dir)) {
    dir.create(cache_dir, recursive = TRUE)
  }

  local_file <- file.path(cache_dir, "se_EPO.RData")

  if (!file.exists(local_file) || force_download) {
    message("Downloading se_EPO data...")
    download.file(url, local_file, mode = "wb", quiet = FALSE)
    message("Download complete.")
  } else {
    message("Loading cached data from: ", local_file)
  }

  # Load using readRDS (file is in RDS format)
  se <- readRDS(local_file)
  return(se)
}
