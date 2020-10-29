# Release

## general
- test negative subset indices
- refs to OpenBabel?
- convertMSFiles()
    - Agilent .d is also a directory?
- runWithoutCache? runWithCacheMode()? shortcut to withr::with_options(patRoon.cache.mode=...)

## AutoID

- update version number
- credits to ES
- tests
    - automatic InChIKey/formula calculation from InChIs/SMILES
    - more?
- ID level rules
    - GenForm scoring: somehow exclude non MS/MS candidates if MS/MS candidates are present?
        - already fine now with minimum rank?
    - add scorings for SIRIUS/DA
    - append/override custom rules via ... argument of defaultIDLevelRules()?
- annotation
    - docs
    - only add sim, ranking etc columns if data is available
- screenSuspects()
    - combine screenSuspects() and groupFeaturesScreening()
        - screenSuspects() does both the screening and making new fGroups
        - as.data.table() for fGroupsScreening which adds suspect metadata and ID levels
        - filter() method for minimal rankings, matched MS/MS fragments etc
        - deprecate features method
        - tag hits, but keep all fGroups?
            - fGroups[, hits = TRUE] ?
            - collapse suspects matched to same fGroups? nice for speeding up annotation
    - check new columns with checkmate (e.g. suspect fragments)
- newProject(): create template auto ID rule csv?


## docs
- improve instructions for MF and SIRIUS installation?


## features
- feature optim:
    - docs
        - mention parameters default unless specified
    - keep retcor_done?
    - get rid of getXCMSSet() calls?
- suspect screening
    - rename patRoonData::targets?
    - rename groupFeaturesScreening?
- filter()
    - document which filters work on feature level (e.g. chromWidth)
    - remove zero values for maxReplicateIntRSD?
- importFeaturesXCMS/importFeaturesXCMS3/importFeatureGroupsXCMS: get rid of anaInfo arg requirement? (or make import func?)
- comparison(): support xcms3? (needs missing support for missing raw data)
- Fix: blank filter with multiple replicate groups (and maybe others?)
- Check: units of plotChord() rt/mz graphs seems off


## MSPeakLists
- isotope tagging is lost after averaging
- collapse averagedPeakLists
- test avg params
- metadata() generic?


## compounds
- SIRIUS: use --auto-charge instead of manually fixing charge of fragments (or not? conflicting docs on what it does)
- test score normalization?
- timeouts for SIRIUS?
- do something about negative H explained fragments by MF?
- PubChemLite
    - Install from Win inst script --> now only tier1, OK?
- SusDat MF support


## formulas
- customize/document ranking column order? (only do rank for sirius?)


## components
- RC: check spearmans correlation
- NT: minimum size argument, combine rows for multiple rGroups?


## reporting
- add more options to reportPlots argument of reportHTML()?

## Cleanup
- Reduce non-exported class only methods


# Future

## General

- msPurity integration
- suspect screening: add MS/MS qualifiers
- fillPeaks for CAMERA (and RAMClustR?)
- support fastcluster for compounds clustering/int component clusters?
- algorithmObject() generic: for xset, xsa, rc, ...
- newProject(): fix multi line delete (when possible)
- more withr wrapping? (dev, par)
- improve default plotting for plotInt and cluster plot functions
- newProject()
    - concentration column for anaInfo
    - generate more detailed script with e.g. commented examples of subsetting, extraction etc
	- newProject(): import Bruker seq file?


## Features

- integrate OpenMS feature scoring and isotopes and PPS in general (also include filters?)
- parallel enviPick
- OpenMS MetaboliteAdductDecharger support?
- OpenMS: Support KD grouper?
- suspect screening: tag fGroups with suspect instead of converting fGroups object (and add filter to remove non-hits)
- Integration of mzMine features (package pending...), MS-DIAL and KPIC2, peakonly, SIRIUS?


## MSPeakLists

- DA
    - generateMSPeakListsDA: find precursor masses with larger window
    - tests
        - utils? EICs with export/vdiffr?
        - test MS peak lists deisotoping?
- metadata for Bruker peaklists?


## Formulas

- DBE calculation for SIRIUS?
- OM reporting
- as.data.table: option to average per replicate group?


## Compounds

- do something with sirius fingerprints? --> comparison?
- fix compoundViewer
- add new MF HD scorings and make sure default normalization equals that of MF web
- CFM-ID and MS-FINDER integration
- utility functions to make custom DBs for MetFrag and SIRIUS and support to use them with the latter


## components
- mass defect components
- CliqueMS
- split peak correlation and adduct etc annotation? would allow better non-target integration

