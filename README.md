# CBEP Graphics Package

<img
    src="https://www.cascobayestuary.org/wp-content/uploads/2014/04/logo_sm.jpg"
    style="position:absolute;top:10px;right:10px;" />

Simple R Package for a consistent graphic look for CBEP 2020-2021 State of Casco 
Bay Report

This is a lightweight package to set up and support Casco Bay Estuary Partnership
(CBEP) technical graphic standards for the 2020-2021 State of Casco Bay (SoCB).

For further information o

# Installing `CBEPgraphics`
## Install `devtools`
If you have not already installed the `devtools`package, 
you will need to do so.

On the R Command Line, enter

`install.packages("devtools")`

Alternatively, you can use the GUI menus in RStudio:

`Tools -> Install Packages... `

Then select the `devtools` package from  the enormous list 
of packages available on CRAN, and the package will be 
installed.

## Install Package

To install a package of interest from GitHub, you need 
to specify both the "Author" and the "Package".  If you 
have a URL to the GitHub Repo, the form of that URL is 
`https://github.com/<Author>/<Package>`, so you have all
the information you need.

```	
library(devtools)
install_github("CBEP-SoCB/CBEPgraphics")
```

Or, alternatively, if you want to avoid polluting your 
search path with an unnecessary environment associated
with `devtools`, you can accomplish the same thing with
the following.

```
devtools::install_github("CBEP-SoCB/CBEPgraphics")
```

# Package Contents
Functions included in this package can be called in R Notebooks
generating draft graphics for transmittal to the SoCB designer.
Editing specifications in this package will affect the look of
all (or almost all) State of the Bay technical graphics generated after any
changes are made.

The workhorse functions include:

    cbep_colors()
    cbep_colors2()
    load_cbep_fonts()
    theme_cbep()
    set_cbep_default_theme()
    
## Colors
The two color functions return a vector of six colors (as hex strings) that
relate well to CBEP design standards.  They differ only in the order in which
the colors are presented.  The first function presents them so that sequential
colors contrast strongly. The second lists colors ordered from darkest to
lightest.  The results of calling these functions (e.g., `cbep_colors()`, not
`cbep_colors`) can be passed to many geoms (as a mapping) or to color and
fill scales as is. Alternatively, specific colors can be passed to a geom as a 
formal parameter by indexing. 

## Fonts
The font function checks to see if necessary fonts are loaded into the R font
database and installs and loads them as necessary.  The primary font used in 
graphics in SoCB is Montserrat.  This function depends on the `extrafont` 
package.  

> Winston Chang, (2014). extrafont: Tools for using fonts. R package version 0.17.
> https://CRAN.R-project.org/package=extrafont

A small warning -- R integration with fonts is a bit tricky. For these functions
to work, the Montserrat family of fonts must be available on your computer, and
the font must be separately registered in the R font database. The package tries 
to load the fonts to the R fonts database, but the effort is not always 
successful.  You may need to work directly with the `extrafont` package to get
around this problem..

## Themes
The theme functions create a theme for use with ggplot graphics.  The theme is
based on `theme_tufte()` from the `ggthemes` package.  The `theme_tufte()` is
modified to use the CBEP preferred font (Montserrat, at this writing), and
increase the size of the base font slightly.

The first theme function just defines the theme, and can be used as a drop-in
for any other ggplot theme.  The second function establishes that theme as the
ggplot default theme, so you don't have to specify that for each graphic in a
script for markdown file.

These two functions requires both `ggplot2` and `ggthemes` to be available.

> H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
> Springer-Verlag New York, 2016.

>  Jeffrey B. Arnold (2019). ggthemes: Extra Themes, Scales and Geoms for
>  'ggplot2'. R package version 4.2.0.
>  https://CRAN.R-project.org/package=ggthemes

