# NuMI at ICARUS Flux Systematics

Systematic uncertainty analysis products for the NuMI beam flux prediction at the ICARUS T600 detector.

This analysis relies on PPFX to produce flux preditions. For more information about PPFX, see: 
- *Neutrino flux predictions for the NuMI beam* [[1]](#references)

- [Link to the official PPFX Redmine repository](https://cdcvs.fnal.gov/redmine/projects/ppfx)

- *(Link to our paper summarizing these results will appear here.)*

## Directories

### ppfx_output

`ppfx_output` contains two subdirectories corresponding to Forward Horn Current (FHC) and Reverse Horn Current (RHC).
Each contain a `nom` subdirectory, which holds the nominal (uncorrected) neutrino flux spectrum, `hnom_nu*`, in addition to the
PPFX central value, `hcv_nu`. Spectra broken down by parent hadron can be found under the `parent` subdirectory.

The remaining subdirectories hold the universes for each hadron production systematic:

1. p + C -> pi + X (pCpi)
2. p + C -> K + X (pCk)
3. p + C -> N + X (pCnu)
4. n + C -> pi + X (nCpi)
5. inclusive meson interactions (mesinc)
6. N + A -> X (nua)
7. N + (Al,Fe) -> X (nuAlFe)
8. p+C xsec attenuation (att)
9. Others
10. All effects (total)

***NOTE:*** This directory also contains the `thintarget` category, which is a combination of effects 1 - 7. A detailed description of this and the other systematic effects can be found in [[1]](#references).

### flux_correction

Directory containing the PPFX-corrected neutrino spectra. These histograms are produced by calculating the means and sigmas
of the flux distributions across the 100 universes contained in `ppfx_output`.

### fractional_uncertainties

Fractional contributions to the flux uncertainty due to hadron production are stored in the `hadron_production` subdirectory.

These are calculated by dividing the sigmas by the means across the 100 PPFX universes.

Beamline systematic uncertainties are also calculated and stored in the `beamline` subdirectory.

Below is a complete list of the beam configurations used for this analysis:

### Beamline Systematics

1. Horn current ± 2 kA
2. Horn 1 position in x/y ± 0.3 cm
3. Beam spot size ± 0.2 mm
4. Horn 2 position in x/y ± 0.3 cm
5. Horn water layer ± 1 mm
6. Beam shift in x/y ± 1 mm
7. Target position in z ± 7 mm
8. Constant average B-field in the decay pipe
9. 54 urad beam divergence

### covariance_matrices

Directory containg the covariance correlation matrices in both `TMatrixD` and `TH2D` formats.
Object names beginning with `h` denote a `TH2`. Separated according to `hadron_production` and `beamline`.

The matrices are 184x184 where each 23x23 submatrix holds the covariance between flavor-energy bins.

The ordering of the submatrices are as follows:

- FHC
  - nue
  - nuebar
  - numu
  - numubar
- RHC
  - nue
  - nuebar
  - numu
  - numubar

The `slices` directory holds several views which might be useful, e.g. covariance between FHC nue-numu bins

### principal_components

This directory houses the outputs of the Principal Component Analysis. 

- `eigenvalues` is a diagonal `TMatrixD` containing each eigenvalue.
- `eigenvectors` is a `TMatrixD` containg the eigenvectors on its rows, sorted by eigenvalue.
- `pca_cov` is the reconstructed covariance matrix after discarding eigenvalues 100 through 184.
- `hpca_cov` holds the same information in a `TH2D`.

### statistical_uncertainty

This is a `TMatrixD` containing the square statistical uncertainties on its diagonal so that it may be
directly added to the covariance matrices.

## File Structure
```
icarus_numi_flux_syst_ana.root
├── ppfx_output
│   ├── fhc
│   │   ├── nom
│   │   │   ├── parent
│   │   │   │   ├── hnom_*_pipm
│   │   │   │   ├── hnom_*_kpm
│   │   │   │   ├── hnom_*_k0l
│   │   │   │   └── hnom_*_mu
│   │   │   ├── hnom_nu*
│   │   │   └── hcv_nu*
│   │   ├── *_thintarget
│   │   │   ├── pCpi
│   │   │   │   └── hthin_pCpi_*
│   │   │   ├── pCk
│   │   │   │   └── hthin_pCk_*
│   │   │   ├── pCnu
│   │   │   │   └── hthin_pCnu_*
│   │   │   ├── nCpi
│   │   │   │   └── hthin_nCpi_*
│   │   │   ├── nua
│   │   │   │   └── hthin_nua_*
│   │   │   ├── nuAlFe
│   │   │   │   └── hthin_nuAlFe_*
│   │   │   ├── mesinc
│   │   │   │   └── hthin_mesinc_*
│   │   │   └── hthin_*
│   │   ├── *_attenuation
│   │   │   └── hatt_*
│   │   └── *_total
│   │       └── htotal_*
│   └── rhc
│       └── **
├── flux_correction
│   ├── hthintarget_*
│   ├── hpCpi_*
│   ├── hpCk_*
│   ├── hpCnu_*
│   ├── hnCpi_*
│   ├── hmesinc_*
│   ├── hnua_*
│   ├── hnuAlFe_*
│   ├── hattenuation_*
│   ├── hothers_*
│   └── htotal_*
├── fractional_uncertainties
│   ├── hadron_production
│   │   ├── hfrac_thintarget_*
│   │   ├── hfrac_pCpi_*
│   │   ├── hfrac_pCk_*
│   │   ├── hfrac_pCnu_*
│   │   ├── hfrac_nCpi_*
│   │   ├── hfrac_mesinc_*
│   │   ├── hfrac_nua_*
│   │   ├── hfrac_nuAlFe_*
│   │   ├── hfrac_attenuation_*
│   │   ├── hfrac_others_*
│   │   └── hfrac_total_*
│   └── beamline
│       ├── hfrac_horn_current_*
│       ├── hfrac_horn1_position_xy_*
│       ├── hfrac_beam_spot_size_*
│       ├── hfrac_horn2_position_xy_*
│       ├── hfrac_water_later_*
│       ├── hfrac_beam_shift_xy_*
│       ├── hfrac_target_position_z_*
│       ├── hfrac_B_field_*
│       └── hfrac_beam_divergence_*
├── covariance_matrices
│   ├── hadron_production
│   │   ├── slices
│   │   │   ├── hcov_fhc_nue_nue
│   │   │   ├── cov_fhc_nue_nue
│   │   │   ├── hcov_fhc_nue_numu
│   │   │   ├── cov_fhc_nue_numu
│   │   │   ├── hcov_fhc_numu_numubar
│   │   │   ├── cov_fhc_numu_numubar
│   │   │   ├── hcov_fhc_nue_nuebar
│   │   │   ├── cov_fhc_nue_nuebar
│   │   │   ├── hcov_fhc_numu_numu
│   │   │   ├── cov_fhc_numu_numu
│   │   │   ├── hcov_fhc_nuebar_nuebar
│   │   │   ├── cov_fhc_nuebar_nuebar
│   │   │   ├── hcov_fhc_nuebar_numubar
│   │   │   ├── cov_fhc_nuebar_numubar
│   │   │   ├── hcov_fhc_numubar_numubar
│   │   │   ├── cov_fhc_numubar_numubar
│   │   │   ├── hcov_rhc_nuebar_nue
│   │   │   ├── cov_rhc_nuebar_nue
│   │   │   ├── hcov_rhc_numubar_numu
│   │   │   └── cov_rhc_numubar_numu
│   │   ├── hcov_thintarget
│   │   ├── hcor_thintarget
│   │   ├── cov_thintarget
│   │   ├── cor_thintarget
│   │   ├── hcov_pCpi
│   │   ├── hcor_pCpi
│   │   ├── cov_pCpi
│   │   ├── cor_pCpi
│   │   ├── hcov_pCk
│   │   ├── hcor_pCk
│   │   ├── cov_pCk
│   │   ├── cor_pCk
│   │   ├── hcov_pCnu
│   │   ├── hcor_pCnu
│   │   ├── cov_pCnu
│   │   ├── cor_pCnu
│   │   ├── hcov_nCpi
│   │   ├── hcor_nCpi
│   │   ├── cov_nCpi
│   │   ├── cor_nCpi
│   │   ├── hcov_mesinc
│   │   ├── hcor_mesinc
│   │   ├── cov_mesinc
│   │   ├── cor_mesinc
│   │   ├── hcov_nua
│   │   ├── hcor_nua
│   │   ├── cov_nua
│   │   ├── cor_nua
│   │   ├── hcov_nuAlFe
│   │   ├── hcor_nuAlFe
│   │   ├── cov_nuAlFe
│   │   ├── cor_nuAlFe
│   │   ├── hcov_attenuation
│   │   ├── hcor_attenuation
│   │   ├── cov_attenuation
│   │   ├── cor_attenuation
│   │   ├── hcov_others
│   │   ├── hcor_others
│   │   ├── cov_others
│   │   ├── cor_others
│   │   ├── hcov_total
│   │   ├── hcor_total
│   │   ├── cov_total
│   │   └── cor_total
│   └── beamline
│       ├── hcov_total
│       ├── hcor_total
│       ├── cov
│       ├── cor
│       ├── hcov_B_field
│       ├── hcor_B_field
│       ├── cov_B_field
│       ├── cor_B_field
│       ├── hcov_beam_divergence
│       ├── hcor_beam_divergence
│       ├── cov_beam_divergence
│       ├── cor_beam_divergence
│       ├── hcov_beam_shift_xy
│       ├── hcor_beam_shift_xy
│       ├── cov_beam_shift_xy
│       ├── cor_beam_shift_xy
│       ├── hcov_beam_spot_size
│       ├── hcor_beam_spot_size
│       ├── cov_beam_spot_size
│       ├── cor_beam_spot_size
│       ├── hcov_horn1_position_xy
│       ├── hcor_horn1_position_xy
│       ├── cov_horn1_position_xy
│       ├── cor_horn1_position_xy
│       ├── hcov_horn2_position_xy
│       ├── hcor_horn2_position_xy
│       ├── cov_horn2_position_xy
│       ├── cor_horn2_position_xy
│       ├── hcov_horn_current
│       ├── hcor_horn_current
│       ├── cov_horn_current
│       ├── cor_horn_current
│       ├── hcov_target_position_z
│       ├── hcor_target_position_z
│       ├── cov_target_position_z
│       ├── cor_target_position_z
│       ├── hcov_water_layer
│       ├── hcor_water_layer
│       ├── cov_water_layer
│       └── cor_water_layer
├── principal_components
│   ├── eigen_values
│   ├── eigen_vectors
│   ├── hpca_cov
│   └── pca_cov
└── statistical_uncertainty
```

## References

[1] [L. Aliaga *et. al* (MINERvA Collaboration), Phys. Rev. D94, 092005 (2016)](https://doi.org/10.1103/PhysRevD.94.092005)