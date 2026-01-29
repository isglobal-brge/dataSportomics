# dataSportomics

Data package for Sportomics courses. Provides functions to download and load omics datasets from exercise physiology studies.

## Installation

```r
# install.packages("remotes")
remotes::install_github("isglobal-brge/dataSportomics")
```

## Usage

```r
library(dataSportomics)

# Load DNA methylation data (HIIT study)
data(eSet_HIIT)
eSet_HIIT

# Load transcriptomics data (EPO study) - coming soon
# data(eSet_EPO)
```

## Datasets

| Function | Description | Size |
|----------|-------------|------|
| `load_eSet_HIIT()` | DNA methylation (Illumina EPIC, 78 samples, HIIT study) | ~500MB |
| `load_eSet_EPO()` | Transcriptomics (EPO study) | TBD |

Data is downloaded from GitHub releases and cached locally.
