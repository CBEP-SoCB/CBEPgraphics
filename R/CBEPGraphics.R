
###########################
# CBEP State of the ay Graphic Defaults for 2020
###########################

# A lightweight package to set up and support Casco Bay Estuary Partnership
# (CBEP) technical graphic standards for the 2020 State of the Bay (SotB).
# Functions included in this package can be called in R Notebooks
# generating draft graphics for transmittal to the SotB designer.
# Editing specifications in theis package will affect the look of
# all (or almost all) State of the Bay technical graphics generated after those
# changes are made.


#----------------------
## Parameters
#----------------------

# Alter these values to change assignments of graphic features.

FONT_FAMILY_NAME    <-  'Montserrat'
FONT_PATTERN <- '[Mm]ontserrat'
CBEP_COLORS  <-  c("#006d87", "#ffde6e", "#303030", "#c1ca38", "#328a9f", "#72aebd")
CBEP_COLORS2 <-  c("#303030", "#006d87", "#328a9f", "#72aebd", "#c1ca38", "#ffde6e")

#----------------------
## Colors
#---------------------

#' Default Colors for CBEP Graphics
#'
#' These functions define default colors for CBEP 2020 State of the Bay Graphics.
#' Each defines a six color sequence useful for standardizing look and feel of
#' CBEP graphics.  These are categorical, not continuous color sequences, so they
#' are not well suited to depicting continuous values.
#'
#'  \code{cbep_colors} returns colors so that adjacent colors contrast nicely.
#'
#'  \code{cbep_colors2} returns colors from darkest to lightest.
#.
#' @return A vector containg six colors.
#' @examples
#'     cbep_colors()
#'     cbep_colors()[5]

cbep_colors <- function() {
  CBEP_COLORS
  }

#' @describeIn cbep_colors Alternate sequence of CBEP colors, ordered from darkest to lightest.

cbep_colors2 <-  function() {
  CBEP_COLORS2
}

#---------------------
## Fonts
#---------------------

#' CBEP Preferred Font
#'
#' Set up R to use CBEP preferred font family.
#'
#' This function loads a CBEP preferred fonts for graphics.  If necessary,
#' the function will try to import related fonts, reporting an error if no
#' members of the font family can be imported. The function loads related
#' fonts to make them available for use in R. Finally, it sets a default
#' font for graphical annotations in ggplot.
#' 
#' The current CBEP Graphics font family is Montserrat.
#'
#' @examples
#'     load_cbep_fonts()
#'
load_cbep_fonts <- function() {
  # Test if the font is already installed/  If not, try to install it.
  #print('Starting  function')
  if (! any(grepl(FONT_PATTERN, extrafont::fonts()))) {
    tryCatch(extrafont::font_import(pattern = FONT_PATTERN, prompt=FALSE),
             error=function (e) {stop('Font could not be imported. Please install font.')})
  }
  #print("Loading fonts")
  suppressMessages(extrafont::loadfonts(device = "win"))
  ggplot2::update_geom_defaults("text", list(family='Montserrat'))      # So similar to theme plotted characters
}

#----------------------
## Themes
#----------------------

#' CBEP Graphic Theme
#'
#' A theme for use with ggplot2 graphics based on theme_tufte().
#'
#' The theme_cbep() graphic theme is a minimalist design based on theme_tufte()
#' from the ggthemes package.  The principal change is that theme_cbep() uses
#' the preferred CBEP font, currently Montserrat.  By default, it also increases
#' the size of all text slightly.
#'
#'
#' @param base_size Integer. Base font size for graphic text. Defaults to 16
#'     point. Text components in ggplot2 graphics wil lbe scaled relative to
#'     (and usually smaller than) this font size.
#' @param base_family String.  Name of an available font family.  Defaults to
#'     the preferred CBEP font, currently Montserrat.
#' @param ... Other theme parameters, passed to theme_tufte().
#'
#' @examples
#'     theme_cbep()

theme_cbep <- function(base_size=16,
                       base_family=FONT_FAMILY_NAME,
                       ...)  {
  ggthemes::theme_tufte(base_size=base_size, base_family=base_family, ...)
  # Other theme modifications could be added here with a call to theme()
}

#' @describeIn theme_cbep This function allows one to set the
#'     default theme for all subsequent ggplot2 graphics, rather than specifying
#'     theme_cbep() for each ggplot2 graphic seperately.

set_cbep_default_theme <- function (...) {
  ggplot2::theme_set(theme_cbep(...))
}

