# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
#
# IMPORTANT (as of 2026-06): The source URL below no longer works. The UNHCR WASH
# dashboard at wash.unhcr.org has been retired; the URL now returns an HTTP 301
# redirect to a handbook page (HTML, not CSV). The data moved into the
# login-gated iRHIS portal (https://his.unhcr.org) under UNHCR's General Policy
# on Personal Data Protection and Privacy (UNHCR/HCP/2022/02), applied at the
# system level. This script is therefore retained for provenance only and can no
# longer be re-run; the shipped dataset is a fixed historical snapshot (2013 to
# 2024). The guard below makes an accidental run fail loudly with an explanation.
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(openxlsx)
library(janitor)
library(readr)
library(tidyverse)

# Read data --------------------------------------------------------------------
url <- "https://wash.unhcr.org/dashboard/data/unhcr_irhis_all_data.csv"

# This source is dead (see header). The guard prevents an accidental run from
# silently parsing the redirect HTML. Remove the stop() only if a working
# replacement source becomes available.
stop(
  "The UNHCR WASH dashboard source URL has been retired and no longer serves a ",
  "CSV (it now redirects to an HTML handbook page). The data is in the ",
  "login-gated iRHIS portal (https://his.unhcr.org). This dataset cannot be ",
  "regenerated; the shipped version is a fixed historical snapshot (2013-2024)."
)

unhcrwash <- readr::read_csv(url, show_col_types = FALSE)

# Tidy data --------------------------------------------------------------------
unhcrwash <- janitor::clean_names(unhcrwash)

# Convert datetime
unhcrwash <- unhcrwash |>
  mutate(date_start = as.Date(date_start),
         date_end = as.Date(date_end),
         reporting_period_annual_indicator= as.Date(reporting_period_annual_indicator))

unhcrwash <- unhcrwash |>
  rename(
    form_id = form_id,
    start_date = date_start,
    end_date = date_end,
    location_id = location_id,
    location_name = location_name,
    country = country_name,
    post_emergency = emergency_post_emergency,
    persons_per_handpump = number_of_persons_per_usable_handpump_well_spring,
    persons_per_tap = number_of_persons_per_usable_water_tap,
    liters_per_person_per_day = average_number_liters_of_potable_water_available_per_person_per_day,
    non_chlorinated_0_cfu = percent_water_quality_tests_at_non_chlorinated_water_collection_locations_with_0_cfu_100ml,
    chlorinated_safe_water_quality = percent_of_water_quality_tests_at_chlorinated_collection_locations_with_frc_in_the_range_0_2_2mg_l_and_turbidity_5ntu5,
    households_with_toilet = percent_households_with_household_toilet_latrine_monthly,
    persons_per_toilet = number_of_persons_per_toilet_latrine,
    persons_per_shower = number_of_persons_per_bath_shelter_shower,
    persons_per_hygiene_promoter = number_of_persons_per_hygiene_promoter,
    refugee_pop = refugee_population,
    reporting_monthly = reporting_period_monthly_indicator,
    liters_per_person_household = average_number_l_p_d_of_potable_water_collected_at_household_level,
    potable_water_storage_10l = percent_households_with_at_least_10_liters_person_potable_water_storage_capacity,
    protected_water_sources = percent_households_collecting_drinking_water_from_protected_treated_sources,
    menstrual_hygiene_satisfaction = percent_of_women_of_reproductive_age_who_are_satisfied_with_menstrual_hygiene_management_materials_and_facilities,
    household_toilet = percent_households_with_household_toilet_latrine,
    defecate_in_toilet = percent_households_reporting_defecating_in_a_toilet,
    access_to_soap = percent_households_with_access_to_soap,
    solid_waste_disposal_access = percent_households_with_access_to_solid_waste_disposal_facility,
    reporting_annual = reporting_period_annual_indicator
  )

unhcrwash <- unhcrwash |>
  mutate_at(vars(1,8:26), as.numeric)


# Export Data ------------------------------------------------------------------
usethis::use_data(unhcrwash, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(unhcrwash,
                 here::here("inst", "extdata", paste0("unhcrwash", ".csv")))
openxlsx::write.xlsx(unhcrwash,
                     here::here("inst", "extdata", paste0("unhcrwash", ".xlsx")))
