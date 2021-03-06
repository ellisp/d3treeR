% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/d3tree2.R
\name{d3tree2}
\alias{d3tree2}
\title{Create an Interactive Treemap (Version 2)}
\usage{
d3tree2(data = NULL, rootname = NULL, celltext = "name", id = "id",
  valueField = "size", width = NULL, height = NULL)
}
\arguments{
\item{data}{the data to be plotted as either
the result of \code{\link[treemap]{treemap}} or
a \code{list} or \code{JSON} as \code{character} or \code{file}
in the form of a \code{d3.js} hierarchy.}

\item{rootname}{\code{character} for the name of the root if \code{data} is a
\code{treemap} object.}

\item{celltext}{\code{character} of the field that contains the title for each cell.  The
default is \code{"name"}.}

\item{id}{\code{character} of the name or id.  The default is \code{"id"}.  Often
\code{d3.js} hierarchies will use \code{"name"} instead of \code{"id"}.  We will use
\code{id} as the default to allow nodes with non-unique names.}

\item{valueField}{\code{character} of the name of the field containing the value on which
you would like your treemap based.  The default is \code{"size"}.}

\item{width,height}{a valid \code{CSS} size for the width and height of the container.
          Percentage values work also by supplying as \code{character} such as \code{width = "100\%"}}
}
\description{
\code{d3tree2} is the primary function for creating interactive d3.js treemaps from
various data types in R.  Easily use \code{\link[treemap]{treemap}} plots customized with
\code{treemap}, or supply a \code{list} for a more typical \code{d3.js} experience, or
blend the two.
}
\examples{
\dontrun{
#####  designed to work seamlessly with treemap
library(treemap)
library(d3treeR)

# example 1 from ?treemap
data(GNI2010)
d3tree2(
   treemap(
     GNI2010
     ,index=c("continent", "iso3")
     ,vSize="population"
     ,vColor="GNI"
     ,type="value"
   )
   , rootname = "World"
)
}

# last example from ?treemap
data(business)
# Brewer's Red-White-Grey palette reversed with predefined range
business$employees.growth <- business$employees - business$employees.prev
d3tree2(
  treemap(business,
       index=c("NACE1", "NACE2"),
       vSize="employees",
       vColor="employees.growth",
       type="value",
       palette="-RdGy",
       range=c(-30000,30000))
  , rootname="Fictitious Business Data"
)
####

#### also works with d3.js json
library(d3treeR)
d3tree2(
  "http://bl.ocks.org/mbostock/raw/4063269/flare.json"
  , celltext = "name"
)
####
}

