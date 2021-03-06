% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mspeaklists.R, R/utils-mspeaklists.R
\docType{class}
\name{MSPeakLists-class}
\alias{MSPeakLists-class}
\alias{MSPeakLists}
\alias{peakLists,MSPeakLists-method}
\alias{peakLists}
\alias{averagedPeakLists,MSPeakLists-method}
\alias{averagedPeakLists}
\alias{analyses,MSPeakLists-method}
\alias{groupNames,MSPeakLists-method}
\alias{length,MSPeakLists-method}
\alias{show,MSPeakLists-method}
\alias{[,MSPeakLists,ANY,ANY,missing-method}
\alias{[[,MSPeakLists,ANY,ANY-method}
\alias{$,MSPeakLists-method}
\alias{as.data.table,MSPeakLists-method}
\alias{filter,MSPeakLists-method}
\alias{plotSpectrum,MSPeakLists-method}
\alias{getDefIsolatePrecParams}
\title{Class containing MS Peak Lists}
\usage{
\S4method{peakLists}{MSPeakLists}(obj)

\S4method{averagedPeakLists}{MSPeakLists}(obj)

\S4method{analyses}{MSPeakLists}(obj)

\S4method{groupNames}{MSPeakLists}(obj)

\S4method{length}{MSPeakLists}(x)

\S4method{show}{MSPeakLists}(object)

\S4method{[}{MSPeakLists,ANY,ANY,missing}(x, i, j, ..., reAverage = TRUE, drop = TRUE)

\S4method{[[}{MSPeakLists,ANY,ANY}(x, i, j)

\S4method{$}{MSPeakLists}(x, name)

\S4method{as.data.table}{MSPeakLists}(x, fGroups = NULL, averaged = TRUE)

\S4method{filter}{MSPeakLists}(
  obj,
  absMSIntThr = NULL,
  absMSMSIntThr = NULL,
  relMSIntThr = NULL,
  relMSMSIntThr = NULL,
  topMSPeaks = NULL,
  topMSMSPeaks = NULL,
  isolatePrec = NULL,
  deIsotopeMS = FALSE,
  deIsotopeMSMS = FALSE,
  withMSMS = FALSE,
  retainPrecursorMSMS = TRUE,
  negate = FALSE
)

\S4method{plotSpectrum}{MSPeakLists}(
  obj,
  groupName,
  analysis = NULL,
  MSLevel = 1,
  title = NULL,
  useGGPlot2 = FALSE,
  xlim = NULL,
  ylim = NULL,
  ...
)

getDefIsolatePrecParams(...)
}
\arguments{
\item{obj, x, object}{The \code{\link{MSPeakLists}} object to access.}

\item{i, j}{A numeric or character value which is used to select analyses/feature groups by
their index or name, respectively (for the order/names see \code{analyses()/groupNames()}).\cr\cr For \code{[}: Can also be logical to perform logical selection
(similar to regular vectors). If missing all analyses/feature groups are selected.\cr\cr For \code{[[}: should be a scalar value. If \code{j} is not specified, \code{i} selects by feature groups instead.}

\item{\dots}{Further arguments passed to \code{\link[graphics]{plot}}.}

\item{reAverage}{Set to \code{TRUE} to regenerate averaged MS peak lists
after subsetting analyses.}

\item{drop}{ignored.}

\item{name}{The feature group name (partially matched).}

\item{fGroups}{The \code{\link{featureGroups}} object that was used to
generate this object. If not \code{NULL} it is used to add feature group
information (retention and \emph{m/z} values).}

\item{averaged}{If \code{TRUE} then feature group averaged peak list data is
used.}

\item{absMSIntThr, absMSMSIntThr, relMSIntThr, relMSMSIntThr}{Absolute/relative
intensity threshold for MS or MS/MS peak lists. \code{NULL} for none.}

\item{topMSPeaks, topMSMSPeaks}{Only consider this amount of MS or MS/MS peaks
with highest intensity. \code{NULL} to consider all.}

\item{isolatePrec}{If not \code{NULL} then value should be a \code{list} with
parameters used for isolating the precursor and its isotopes in MS peak
lists (see \verb{Isolating precursor data}). Alternatively, \code{TRUE} to
apply the filter with default settings (as given with
\code{getDefIsolatePrecParams}).}

\item{deIsotopeMS, deIsotopeMSMS}{Remove any isotopic peaks in MS or MS/MS
peak lists. This may improve data processing steps which do not assume the
presence of isotopic peaks (e.g. MetFrag for MS/MS). Note that
\code{getMzRPeakLists} does not (yet) support flagging of isotopes.}

\item{withMSMS}{If set to \code{TRUE} then only results will be retained for
which MS/MS data is available. if \code{negate=TRUE} then only results
\emph{without} MS/MS data will be retained.}

\item{retainPrecursorMSMS}{If \code{TRUE} then precursor peaks will never be
filtered out from MS/MS peak lists (note that precursors are never removed
from MS peak lists). The \code{negate} argument does not affect this
setting.}

\item{negate}{If \code{TRUE} then filters are applied in opposite manner.}

\item{groupName}{The name of the feature group for which a plot should be
made.}

\item{analysis}{The name of the analysis for which a plot should be made. If
\code{NULL} then data from the feature group averaged peak list is used.}

\item{MSLevel}{The MS level: \samp{1} for regular MS, \samp{2} for MSMS.}

\item{title}{The title of the plot. If \code{NULL} a title will be
automatically made.}

\item{useGGPlot2}{If \code{TRUE} then \pkg{\link{ggplot2}} is used for
plotting, otherwise base plot used. For \code{plotSpectrum}, \code{ggplot2}
allows nicely repelled text for annotation. However, base plot is generally
faster.}

\item{xlim, ylim}{Sets the plot size limits used by
\code{\link[graphics]{plot}}. Set to \code{NULL} for automatic plot sizing.}
}
\value{
\code{peakLists} returns a nested list containing MS (and MS/MS where
  available) peak lists per feature group and per analysis. The format is:
  \code{[[analysis]][[featureGroupName]][[MSType]][[PeakLists]]} where
  \code{MSType} is either \code{"MS"} or \code{"MSMS"} and \code{PeakLists} a
  \code{\link{data.table}} containing all \emph{m/z} values (\code{mz}
  column) and their intensities (\code{intensity} column). In addition, the
  peak list tables may contain a \code{cmp} column which contains an unique
  alphabetical identifier to which isotopic cluster (or "compound") a mass
  belongs (only supported by MS peak lists generated by Bruker tools at the
  moment).

\code{averagedPeakLists} returns a nested list of feature group
  averaged peak lists in a similar format as \code{peakLists}.

\code{plotSpectrum} will return a \code{\link[=ggplot2]{ggplot
  object}} if \code{useGGPlot2} is \code{TRUE}.
}
\description{
Contains all MS (and MS/MS where available) peak lists for a
\code{\link{featureGroups}} object.
}
\details{
Objects for this class are returned by \link[=MSPeakLists-generation]{MS peak
lists generators}.

The \code{getDefIsolatePrecParams} is used to create a parameter
  list for isolating the precursor and its isotopes (see \verb{Isolating precursor data}).
}
\section{Methods (by generic)}{
\itemize{
\item \code{peakLists}: Accessor method to obtain the MS peak lists.

\item \code{averagedPeakLists}: Accessor method to obtain the feature group averaged
MS peak lists.

\item \code{analyses}: returns a \code{character} vector with the names of the
analyses for which data is present in this object.

\item \code{groupNames}: returns a \code{character} vector with the names of the
feature groups for which data is present in this object.

\item \code{length}: Obtain total number of \emph{m/z} values.

\item \code{show}: Shows summary information for this object.

\item \code{[}: Subset on analyses/feature groups.

\item \code{[[}: Extract a list with MS and MS/MS (if available) peak
lists. If the second argument (\code{j}) is not specified the averaged peak
lists for the group specified by the first argument (\code{i}) will be
returned.

\item \code{$}: Extract group averaged MS peaklists for a feature group.

\item \code{as.data.table}: Returns all MS peak list data in a table.

\item \code{filter}: provides post filtering of generated MS peak lists,
which may further enhance quality of subsequent workflow steps (\emph{e.g.}
formulae calculation and compounds identification) and/or speed up these
processes.

\item \code{plotSpectrum}: Plots a spectrum using MS or MS/MS peak lists for a
given feature group.
}}

\section{Slots}{

\describe{
\item{\code{peakLists}}{Contains a list of all MS (and MS/MS) peak lists. Use the
\code{peakLists} method for access.}

\item{\code{metadata}}{Metadata for all spectra used to generate peak lists. Follows
the format of the \code{peakLists} slot.}

\item{\code{averagedPeakLists}}{A \code{list} with averaged MS (and MS/MS) peak lists
for each feature group.}

\item{\code{avgPeakListArgs}}{A \code{list} with arguments used to generate feature
group averaged MS(/MS) peak lists.}

\item{\code{origFGNames}}{A \code{character} with the original input feature group
names.}
}}

\section{Isolating precursor data}{
 Formula calculation typically relies on
  evaluating the measured isotopic pattern from the precursor to score
  candidates. Some algorithms (currently only \command{GenForm}) penalize
  candidates if mass peaks are present in MS1 spectra that do not contribute
  to the isotopic pattern. Since these spectra are typically very 'noisy' due
  to background and co-eluting ions, an additional filtering step may be
  recommended prior to formula calculation. During this precursor isolation
  step all mass peaks are removed that are (1) not the precursor and (2) not
  likely to be an isotopologue of the precursor. To determine potential
  isotopic peaks the following parameters are used:

  \itemize{

  \item \code{maxIsotopes} The maximum number of isotopes to consider. For
  instance, a value of \samp{5} means that \code{M+0} (\emph{i.e.} the
  monoisotopic peak) till \code{M+5} is considered. All mass peaks outside
  this range are removed.

  \item \code{mzDefectRange} A two-sized \code{vector} specifying the minimum
  (can be negative) and maximum \emph{m/z} defect deviation compared to the
  precursor \emph{m/z} defect. When chlorinated, brominated or other
  compounds with strong \emph{m/z} defect in their isotopologues are to be
  considered a higher range may be desired. On the other hand, for natural
  compounds this range may be tightened. Note that the search range is
  propegated with increasing distance from the precursor, \emph{e.g.} the
  search range is doubled for \code{M+2}, tripled for \code{M+3} etc.

  \item \code{intRange} A two-sized \code{vector} specifying the minimum and
  maximum relative intensity range compared to the precursor. For instance,
  \code{c(0.001, 2)} removes all peaks that have an intensity below 0.1\% or
  above 200\% of that of the precursor.

  \item \code{z} The \code{z} value (\emph{i.e.} absolute charge) to be
  considerd. For instance, a value of \code{2} would look for \code{M+0.5},
  \code{M+1} etc. Note that the \code{mzDefectRange} is adjusted accordingly
  (\emph{e.g.} halved if \code{z=2}).

  \item \code{maxGap} The maximum number of missing adjacent isotopic peaks
  ('gaps'). If the (rounded) \emph{m/z} difference to the previous peak
  exceeds this value then this and all next peaks will be removed. Similar to
  \code{z}, the maximum gap is automatically adjusted for \code{charge}.

  }

  These parameters should be in a \code{list} that is passed to the
  \code{isolatePrec} argument to \code{filter}. The default values can be
  obtained with the \code{getDefIsolatePrecParams} function:

\code{maxIsotopes=5}; \code{mzDefectRange=c(-0.01, 0.01)}; \code{intRange=c(0.001, 2)}; \code{z=1}; \code{maxGap=2}
}

\section{S4 class hierarchy}{
 \itemize{   \item{\code{\link{workflowStep}}}   \itemize{     \item{\strong{\code{\link{MSPeakLists}}}}   } }
}

