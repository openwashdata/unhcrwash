# Changelog

## unhcrwash 0.2.0

### Maintainer and authorship

- Lars Schöbitz is now the maintainer of the package. Yash Dubey remains
  an author, and ETH Zurich is recorded as funder.

### Documentation and metadata fixes

- Corrected the data dictionary (`data-raw/dictionary.csv`) and the
  dataset documentation (`R/unhcrwash.R`) to match the actual shipped
  column names. 25 of 27 variable names previously referred to the
  original UNHCR field names rather than the renamed columns in the
  published data.
- Corrected the dataset description across the package: the data covers
  227 sites and 36 countries (previously stated as 191 sites and 29
  countries).
- Kept package metadata in `data/metadata/` in sync with the corrected
  dictionary and counts.

### Data source status

- Documented that the upstream UNHCR WASH dashboard has been retired.
  The former source URL
  (`https://wash.unhcr.org/dashboard/data/unhcr_irhis_all_data.csv`) now
  redirects to a handbook page, and the data has moved into the
  login-gated iRHIS portal (`https://his.unhcr.org`) under UNHCR’s
  General Policy on Personal Data Protection and Privacy
  (UNHCR/HCP/2022/02).
- As a result, this dataset is a fixed historical snapshot (2013
  to 2024) and can no longer be regenerated.
  `data-raw/data_processing.R` is retained for provenance and now stops
  with an explanatory error if run.
- Clarified that the data in this package is site-level aggregate WASH
  indicators. It contains no personal data and poses no data-protection
  concern.

## unhcrwash 0.1.0

- Initial release.
