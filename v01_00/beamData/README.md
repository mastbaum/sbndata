# beamData

`beamData/` directory contains histograms and covariance matrcies related to the Booster Neutrino Beam data and simulations 
that are stored at uboone directory of version `v08_00_00_54`.
These matrices are required to produce flux uncertainties. There are two parts of it: non-hadron production and hadron production.

- `Unisim` for non-hadron production uncertainty; it uses 
  - CV simulation from BooBeamNT with parents redecayed 1000 times: *beamData/UnisimHists/may06_10kpot_ntrd1000_flux. root*
  - Variations for different universes are from MiniBooNE beam simulations (see [MicroBooNE-doc-7866](https://microboone-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=7866) or [SBN-doc-22325-v2](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=22325) ). 
  They are produced by fine tuning one of the tunable variables:
    - *beamData/UnisimHists/may06_horn175ka_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_horn175ka_rgen610.6_flux.root*
    - *beamData/UnisimHists/may06_pioninexsec_up_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_pioninexsec_down_rgen610.6_flux.root*
    - *beamData/UnisimHists/may06_pionqexsec_up_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_pionqexsec_down_rgen610.6_flux.root*
    - *beamData/UnisimHists/may06_piontotxsec_up_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_piontotxsec_down_rgen610.6_flux.root*
    - *beamData/UnisimHists/may06_nucleoninexsec_up_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_nucleoninexsec_down_rgen610.6_flux.root*
    - *beamData/UnisimHists/may06_nucleonqexsec_up_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_nucleonqexsec_down_rgen610.6_flux.root*
    - *beamData/UnisimHists/may06_nucleontotxsec_up_rgen610.6_flux.root*	
    - *beamData/UnisimHists/may06_nucleontotxsec_down_rgen610.6_flux.root*
    - *beamData/UnisimHists/expskin_nrtd1000_flux.root*
    - *beamData/UnisimHists/expskin_nrtd1000_flux.root*

- Hadron production uncertainty are derived from world data:
  - *beamData/ExternalData/BNBExternalData_uBooNE.root*
  - *beamData/ExternalData/BNBExternalData_uBooNE_SplinesHARP.root*


