# sas-to-r
https://blogs.sas.com/content/iml/2013/09/16/what-versions-of-r-are-supported-by-sas.html

Due to the feature change in r 4.3.0 (elimination of default.stringsAsFactors()), the ExportDataSetToR and ExportMatrixToR will return error on my SAS 9.4 M6.

This short code trunk provides an alternative way for loading dataset from sas to r.

by: 
1. get the folder location
2. port the parameter to r
3. read sas dataset inside of r

