# NuMI at ICARUS Flux Systematics

Systematic uncertainty analysis products for the NuMI beam flux prediction at the ICARUS detector.

This analysis relies on PPFX to produce flux preditions. For more information about PPFX and this analysis, see: 
- [Prediction of NuMI electron and muon neutrino flux in ICARUS](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=27384)

- *Neutrino flux predictions for the NuMI beam* [[1]](#references)

- [Link to the official PPFX Redmine repository](https://cdcvs.fnal.gov/redmine/projects/ppfx)

## Directories
### `covariance_matrices`

The top level directory contains two `TH2D`: `hcorr_total` and `hcov_total`, which hold the total (stat + hadron + beam) correlation and covariance across the full neutrino energy-flavor space. 

Each bin is labeled according to horn polarity, neutrino flavor, and energy bin number, e.g., `fhc-nue-1`.

A `TAxis` object containing the bin structure called `matrix_TAxis` can also be found here.

### `flux_prediction`

This directory holds a set of `TH1D` for each neutrino mode. The flux value is extracted as the PPFX mean, while the uncertainties incorporate
statistical, hadron systematic, and beam systematic uncertainties.

### `ppfx_output`

`ppfx_output` contains the original output received from PPFX. two subdirectories corresponding to Forward Horn Current (FHC) and Reverse Horn Current (RHC).
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

### `ppfx_corrected_flux`

Directory containing the PPFX-corrected neutrino spectra. These histograms are produced by calculating the means and sigmas
of the flux distributions across the 100 universes contained in `ppfx_output`.

### `fractional_uncertainties`

Fractional contributions to the flux uncertainty due to hadron production are stored in the `hadron` subdirectory.

These are calculated by dividing the sigmas by the means across the 100 PPFX universes.

Beamline systematic uncertainties are also calculated and stored in the `beam` subdirectory.

Below is a complete list of the beam configurations used for this analysis:

### Beamline Systematics

1. Run 8-9: Horn current ± 2 kA
2. Run 10-13: Horn 1 position in x/y ± 0.3 cm
3. Run 14-16: Beam spot size ± 0.2 mm
4. Run 17-20: Horn 2 position in x/y ± 0.3 cm
5. Run 22-23: Horn water layer ± 1 mm
6. Run 24-27: Beam shift in x/y ± 1 mm
7. Run 28-29: Target position in z ± 7 mm
8. Run 30: Constant average B-field in the decay pipe
9. Run 32: 54 urad beam divergence

***NOTE:*** *Runs 21 and 31 consist of flux simulated with alternative descriptions of the NuMI horns and are unused in this analysis.*

### `pca`

This directory houses the outputs of the Principal Component Analysis. 

- `compontents/hpc_evec_*` unit principal components.
- `components/hpc_evec_scaled_*` principal components scaled by the corresponding eigenvalue.
- `hcov_pca` reconstructed hadron covariance matrix after discarding degenerate components.

### `statistical_uncertainties`

This directory contains `TH1D` objects representing statistical uncertainties for each neutrino mode in both a fractional and absolute scale (ending in `_abs`).

A `TH2D` called `hmat_stat` is a diagonal matrix with the statistical uncertainties in absolute units.

## References

[1] [L. Aliaga *et. al* (MINERvA Collaboration), Phys. Rev. D94, 092005 (2016)](https://doi.org/10.1103/PhysRevD.94.092005)
