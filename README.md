#Developing Data Products Project - Shiny app

## About this app

Welcome! This application (app) was developed to query databases on several Crops Water Stress and how it affects their yield, and Photosynthesis worldwide. Information like these are scattered, not easy to find, often their quality is questionable and is not available online. Instead, you must download and use locally.

For those reasons, thanks to this application you can:

* Check high quality data sets interactively online.

* Conduct an analysis of correlation between all the variables included.

* Perform a linear regression between the dependent and independent variables, according to user interest.

* Plot the regression model and the results of the analysis.

* Configure a report with the information of interest, the name of user and a brief analysis, in the desired downloadable format.


## Using the app online

It's very easy! Only these steps are required:

* Go to App running online here: https://larrylugo.shinyapps.io/DevDataProdProjectFinal 

* On Side Menu, please choose a data set between: Crops (% of water stress and yield of several crops); or Photosynthesis (CO2 assimilation rate and factors affecting it, by reference sources in various crops).

* Select the Dependent Variable from the dropdown menu. Then, 

* Select the Independent Variable from the dropdown menu.

* See the information of your interest on Main Menu tabs (on top): 

	+ Data. Shows raw data. You can specify how many rows want to see.

	+ Summary Statistics. Displays dependent and independent variables percentiles.

	+ Histograms. This tab shows selected variables' histograms. You can decide "Number of bins" to be displayed.

	+ Scatter Plot. Plot the relationship between variables.

	+ Correlations. The whole correlation matrix is showed.

	+ Model. Summarizes the model output.

	+ Residuals. Plots residuals and Normal Q-Q test output.

	+ Help: App's help doc.


## Using the app locally

You can run this app on your computer doing this:

* Install R software from here: https://www.r-project.org/

* Install and load the following libraries: googleVis, knitr and shiny.

* Download the whole files and folders from GitHub here.

* Run R or RStudio. Set the folder where the files were downloaded as your working directory, and

* Run command "runApp()".


## Data source

Crops water stress: http://wri.org/publication/aqueduct-metadata-global

Photosynthesis: https://daac.ornl.gov/cgi-bin/dsviewer.pl?ds_id=1224


## Coding: sources, tips and tricks

Shiny gallery: http://www.showmeshiny.com/

Shiny Showcase: https://www.rstudio.com/products/shiny/shiny-user-showcase/

Style your apps with CSS: http://shiny.rstudio.com/articles/css.html

Free themes for Bootstrap: https://bootswatch.com/

Shiny tags glossary: http://shiny.rstudio.com/articles/tag-glossary.html

Customize your UI with HTML: http://shiny.rstudio.com/articles/html-tags.html


## References

Gassert, F., M. Luck, M. Landis, P. Reig, and T. Shiao. 2013. “Aqueduct Global Maps 2.0.” Working Paper. Washington, DC: World Resources Institute. Available online at http://wri.org/publication/aqueduct-metadata-global.

Walker, A.P., I. Aranda, A.P. Beckerman, H. Bown, L.A. Cernusak, Q.L. Dang, T.F. Domingues, L. Gu, S. Guo, Q. Han, J. Kattge, M. Kubiske, D. Manter, E. Merilo, G. Midgley, A. Porte, J.C. Scales, D. Tissue, T. Turnbull, C. Warren, G. Wohlfahrt, F.I. Woodward, and S.D. Wullschleger. 2014. A Global Data Set of Leaf Photosynthetic Rates, Leaf N and P, and Specific Leaf Area. Data set. Available on-line [http://daac.ornl.gov] from Oak Ridge National Laboratory Distributed Active Archive Center, Oak Ridge, Tennessee, USA. http://dx.doi.org/10.3334/ORNLDAAC/1224
