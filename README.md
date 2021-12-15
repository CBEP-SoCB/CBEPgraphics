# CBEP Graphics Package

<img
    src="https://www.cascobayestuary.org/wp-content/uploads/2014/04/logo_sm.jpg"
    style="position:absolute;top:10px;right:10px;" />

Simple R Package for a consistent graphic look for CBEP 2020-2021 State of Casco 
Bay Report

This is a lightweight package to set up and support Casco Bay Estuary Partnership
(CBEP) technical graphic standards for the 2020-2021 State of Casco Bay (SoCB).

For further information on State of Casco Bay report, go the the Casco Bay
Estuary Partnership [website]( https://cascobayestuary.org).

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
the font must be separately registered in the R font database. 

The 'Montserrat' font is a free Google font available 
[here](https://fonts.google.com/specimen/Montserrat).  Download the font family,
then install the fonts on your computer.  Instructions for installing fonts vary
by operating system.  On Windows, unzip the font archive, and copy the font
files to your `Fonts` folder.  The `Fonts` folder is usually at
`C:\Windows\Fonts`.

The package tries to load the fonts to the R fonts database, via the 
`load_cbep_fints()` function, but the effort is not always 
successful.  You may need to work directly with the `extrafont` package to get
around this problem.

In particular, in recent years, the `load_cbep_fonts()` command has been failing
due to a problem in a supporting package, "Rttr2pt1", which in turn depends on
the "ttf2pt1" program, which apparently is no longer being maintained. A 
work-around exists, and has been posted several places online, including 
[here](https://stackoverflow.com/questions/61204259/how-can-i-resolve-the-no-font-name-issue-when-importing-fonts-into-r-using-ext/66532692#66532692).  

The heart of the work-around is force-installing an earlier version of the
"Rttf2pt1" package, as follows:

```
install.packages("remotes")
remotes::install_version("Rttf2pt1", version = "1.3.8")
```

After that, the CBEPgraphics package should run correctly. Loading all the fonts
on your system into the R font database can be time consuming. CBEPgraphics only
installs the Montserrat fonts in the R font database.  If you plan
to use other fonts in R, you may want to run the following as well:

```
extrafont::font_import()
```

Eventually, we may migrate the package -- or a successor package, since this one
was tied to the State of Casco BAy report -- to depend on the `showtext` 
package, but with this workaround, that is not strictly necessary for the time being.

## Themes
The theme functions create a theme for use with ggplot graphics.  The theme is
based on `theme_tufte()` from the `ggthemes` package.  The `theme_tufte()` is
modified to use the CBEP preferred font (Montserrat, at this writing), and
increase the size of the base font slightly.

The first theme function just defines the theme, and can be used as a drop-in
for any other ggplot theme.  The second function establishes that theme as the
ggplot default theme, so you don't have to specify that for each graphic in a
script or markdown file.

These two functions requires both `ggplot2` and `ggthemes` to be available.

> H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
> Springer-Verlag New York, 2016.

>  Jeffrey B. Arnold (2019). ggthemes: Extra Themes, Scales and Geoms for
>  'ggplot2'. R package version 4.2.0.
>  https://CRAN.R-project.org/package=ggthemes

