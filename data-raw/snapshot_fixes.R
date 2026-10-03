# Description ------------------------------------------------------------------
# Corrections to the shipped snapshot of unhcrwash.
#
# data_processing.R can no longer be re-run because the source is retired (see
# its header). Corrections to the data are therefore applied to the shipped
# snapshot in data/unhcrwash.rda by this script, and the CSV and XLSX exports in
# inst/extdata/ are written again from the corrected object. Run it from the
# package root. Each step is safe to run more than once.
# Load packages ----------------------------------------------------------------
library(usethis)
library(fs)
library(here)
library(readr)
library(openxlsx)

load(here::here("data", "unhcrwash.rda"))

# 1. Drop rows in which every column is missing (issue #3) ---------------------
# The snapshot ended with two rows (6424 and 6425) that hold no values at all.
# They added a missing form_id, an exact duplicate row, and one extra site and
# country to the counts.
all_missing <- rowSums(!is.na(unhcrwash)) == 0
message("Dropping ", sum(all_missing), " rows in which every column is missing")
unhcrwash <- unhcrwash[!all_missing, ]

# Export Data ------------------------------------------------------------------
usethis::use_data(unhcrwash, overwrite = TRUE, version = 2)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(unhcrwash,
                 here::here("inst", "extdata", paste0("unhcrwash", ".csv")))
openxlsx::write.xlsx(unhcrwash,
                     here::here("inst", "extdata", paste0("unhcrwash", ".xlsx")))
