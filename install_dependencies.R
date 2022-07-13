library(versions)

Sys.setenv(TZ='GMT')
Sys.setenv(USE_SYSTEM_LIBGIT2=1)
Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)

dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
    "CXX14=g++", # or clang++ but you may need a version postfix
    file = M, sep = "\n", append = TRUE)

install.versions("devtools", '2.4.3')
require(devtools)
install_version("readxl", version = "1.3.1", repos = "http://cran.us.r-project.org")
install_version("graphicalVAR", version = "0.3", repos = "http://cran.us.r-project.org")
install_version("tidyverse", version = "1.3.1", repos = "http://cran.us.r-project.org")
install_version("qgraph", version = "1.9", repos = "http://cran.us.r-project.org")
install_version("ggplot2", version = "3.3.5", repos = "http://cran.us.r-project.org")
install_version("mice", version = "3.14.0", repos = "http://cran.us.r-project.org")
install_version("VIM", version = "6.1.1", repos = "http://cran.us.r-project.org")
install_version("sjmisc", version = "2.8.9", repos = "http://cran.us.r-project.org")
install_version("hash", version = "2.2.6.1", repos = "http://cran.us.r-project.org")
install_version("tidyr", version = "1.1.4", repos = "http://cran.us.r-project.org")
install_version("dplyr", version = "1.0.7", repos = "http://cran.us.r-project.org")
install_version("readr", version = "2.1.1", repos = "http://cran.us.r-project.org")
install_version("tibble", version = "3.1.6", repos = "http://cran.us.r-project.org")
install_version("rjson", version = "0.2.21", repos = "http://cran.us.r-project.org")

