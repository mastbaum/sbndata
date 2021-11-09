# sbndata

This package is designed to contain external data needed for SBN. It is versioned with tags and released as ups product available from `/cvmfs/sbn.opensciencegrid.org/products/sbn`

It contains the following main directories:

- `ups`: This contains all the generic setup to define this as a UPS product.
- `beamData/BNBdata`: used for flux uncertainties production. Contains histograms and covariance matrcies related to the Booster Neutrino Beam data and simulations. From uboone directory of version v08_00_00_54, provided by Keng Lin.
- `beamData/NuMIdata`: Systematic uncertainty analysis products for the NuMI beam flux prediction. From NuMI beam flux prediction at the ICARUS T600 detector, provided by Anthony Wood (https://gitlab.com/antwood/numi-at-icarus-flux-systematics)

