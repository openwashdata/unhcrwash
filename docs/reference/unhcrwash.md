# unhcrwash: Refugee Camp WASH indicators data from the United Nations High Commissioner for Refugees

This is a dataset on WASH indicators in refugee camps and settlements.
The data was collected from the UNHCR Information Management System
(IRIS) and was available on the UNHCR WASH dashboard. This dataset
includes data from 227 sites and 36 countries. The source dashboard has
since been retired, so this dataset is a fixed historical snapshot (2013
to 2024) that can no longer be regenerated. See the package README for
details.

## Usage

``` r
unhcrwash
```

## Format

A tibble with 6425 rows and 27 variables

- form_id:

  Unique Identifier for the form

- start_date:

  Start Date for the data collection

- end_date:

  End date for the data collection

- location_id:

  Unique Identifier for the location of the refugee camp

- location_name:

  Name of the location of the refugee camp

- country:

  Country in which the refugee camp is located

- post_emergency:

  If emergency is ongoing or not (Emergency / Post Emergency)

- persons_per_handpump:

  No. of persons per usable handpump well spring

- persons_per_tap:

  Number of persons per unit of usable tap water source

- liters_per_person_per_day:

  Average number of litres of potable water available per person per day

- non_chlorinated_0_cfu:

  Percentage of water quality tests conducted at non-chlorinated water
  collection points that returned results with 0 colony-forming units
  (CFU) per 100 milliliters

- chlorinated_safe_water_quality:

  Percentage of water quality tests at chlorinated collection points
  where the Free Residual Chlorine (FRC) levels were within the range of
  0.2 to 2 mg/L, and turbidity was less than or equal to 5 NTU
  (Nephelometric Turbidity Units)

- households_with_toilet:

  Percentage of households that have access to a household toilet or
  latrine, evaluated on a monthly basis

- persons_per_toilet:

  Number of persons per toilet latrine

- persons_per_shower:

  Number of persons per bath shower

- persons_per_hygiene_promoter:

  Number of persons per hygiene promoter

- refugee_pop:

  Refugee Population

- reporting_monthly:

  Monthly Reporting Period Indicator

- liters_per_person_household:

  Average water (litres) collected per household per day

- potable_water_storage_10l:

  Percentage of households with at least 10 litres of water storage
  capacity

- protected_water_sources:

  Percentage of households collecting water from sheltered and treated
  sources

- menstrual_hygiene_satisfaction:

  Percentage of women of reproductive age satisfied with facilities for
  management of menstrual hygiene and waste

- household_toilet:

  Percentage of households with a latrine

- defecate_in_toilet:

  Percentage of households defecating in a toilet

- access_to_soap:

  Percentage of households with access to soap

- solid_waste_disposal_access:

  Percentage of households with access to a waste disposal facility

- reporting_annual:

  Annual Reporting Period Indicator

## Source

UNHCR WASH dashboard / Information Management System (IRIS), formerly at
\<https://wash.unhcr.org/dashboard/data/unhcr_irhis_all_data.csv\>
(retired; data now in the login-gated iRHIS portal at
\<https://his.unhcr.org\>).
