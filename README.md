pov-viewshed
============

Code for creating fine scale view-sheds in PovRay, e.g. see https://smathermather.wordpress.com/tag/viewshed/ .

This is really early code for doing viewshed analyses in PovRay.  The viewsheds are distinct from most viewshed software in that they explicitly contain tree canopy vegetation, and viewsheds can be calculated for leaf on and leaf off conditions, for those of us with deciduous trees.  The repository contains everything needed to render a viewshed in PovRay, including tree points, a digital elevation model in PNG format, and the PovRay code itself.  

Typical viewsheds from GIS software provide an unrealistic result, as they don't take into account complicated scene elements, like trees and buildings, e.g.:

[[viewshed_no_trees.png]]


In the future, Tree-interpolator, at https://github.com/smathermather/tree-interpolator, will a good source for generating the necessary array of tree locations and heights.  Expect more project integration between these two in the future.

To create a 16-bit PNG from a digital elevation model (DEM) for the basal topography, look to gdal_translate.  This too will eventually be baked into the tool.
