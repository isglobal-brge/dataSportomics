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

# Load transcriptomics data (EPO study)
data(se_EPO)
se_EPO
```

## Datasets

| Dataset | Function | Description | Size |
|---------|----------|-------------|------|
| `eSet_HIIT` | `load_eSet_HIIT()` | DNA methylation (Illumina EPIC, 78 samples, HIIT study) | ~500MB |
| `se_EPO` | `load_se_EPO()` | RNA-seq SummarizedExperiment (16,738 genes, 50 samples, EPO study) | ~2MB |

Data is downloaded from GitHub releases and cached locally.
