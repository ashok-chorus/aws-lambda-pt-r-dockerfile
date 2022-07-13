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
install.versions("readxl", "1.3.1")
install.dates("shiny", "2020-10-23")
install.versions("graphicalVAR", "0.2.4")
install.versions("tidyverse", "1.3.1")
install.versions("qgraph", "1.9")
install.versions("ggplot2", "3.3.5")
install.versions("mice", "3.14.0")
install.versions("VIM", "6.1.1")
install.versions("sjmisc", "2.8.9")
install.versions("hash", "2.2.6.1")
install.versions("tidyr", "1.1.4")
install.versions("dplyr", "1.0.7")
install.versions("readr", "2.1.1")
install.versions("tibble", "3.1.6")
install.versions("rjson", "0.2.21")


