# sas-to-r

https://blogs.sas.com/content/iml/2013/09/16/what-versions-of-r-are-supported-by-sas.html

Due to the feature change in r 4.3.0 (elimination of default.stringsAsFactors()), the ExportDataSetToR and ExportMatrixToR will return error on my SAS 9.4 M6.


ERROR: R: Error: 'default.stringsAsFactors' is defunct.
ERROR: R: Use '`stringsAsFactors = FALSE`' instead.
ERROR: R: See help("Defunct")
ERROR: Execution error as noted previously. (rc=1000)


To (maybe very few) people who want to run r inside of sas, this short code trunk provides an alternative way for loading dataset from sas to r.

by: 
1. get the folder location
2. port the parameter to r
3. read sas dataset inside of r

PS: 
## run r in sas

1. SUPPOSE YOU ARE USING SAS 9.4 (ENGLISH) AND R 4.2.2 (2022-10-31 ucrt) -- "Innocent and Trusting"
2. AT PATH "C:\Program Files\SASHome\SASFoundation\9.4\nls\en" LOCATE FILE SASV9.CFG
	MAKE A COPY OF IT, RENAME AS SASV9.CFG.BACKUP (OR OTHER EXTENSION)

 ![image](https://github.com/DW-AN/sas-to-r/assets/64296207/9551bfdd-a278-4db4-95d0-96bac8318db6)

3. OPEN WITH NOTEPAD, ADD A NEW LINE WITH THE FOLLOWING CODE AND SAVE THE FILE TO DESKTOP:
``-RLANG``
4. TO MAKE IT SAFE FOR ALL SAS 9.4 VARIANT (E.G. ENGLISH WITH DBCS) YOU MAY AS WELL CONFIGURE OTHER SASV9.CFG ALL IN THE SAME ROOT (NLS) BUT DIFFERENT SUBFOLDER.
OPEN WITH NOTEPAD, ADD A NEW LINE WITH THE FOLLOWING CODE AND SAVE THE FILE TO DESKTOP:

![image](https://github.com/DW-AN/sas-to-r/assets/64296207/4613cb2c-420a-49e5-bbee-e9b8d6e95cec)


6. MOVE THE FILE TO THE ORIGINAL PATH, ALLOW ADMINISTRATOR PRIVILLAGE IF REQUIRED BY WINDOWS
CHECK IF THE USER DEFINED ENVIRONMENT VARIABLE R_HOME EXISTS (IF NOT, ADD A NEW ONE) AND POINTS TO R DIRECTORY (E.G. C:\PROGRAM FILES\R\R-4.2.2)

7. CHECK IF THE USER DEFINED ENVIRONMENT VARIABLE R_HOME EXISTS (IF NOT, ADD A NEW ONE) AND POINTS TO R DIRECTORY (E.G. C:\PROGRAM FILES\R\R-4.2.2)
8. 	RESTART THE COMPUTER
OPEN SAS AND RUN THE FOLLOWING TO CHECK IF THERE IS ANY R-STYLE OUTPUT (UNDERLINE FOR R CODE)


```sas
proc iml;
	    /* Comparison of matrix operations in IML and R */
	    print "----------  SAS/IML Results  -----------------";
	    x = 1:3;                                 /* vector of sequence 1,2,3 */
	    m = {1 2 3, 4 5 6, 7 8 9};               /* 3 x 3 matrix */
	    q = m * t(x);                            /* matrix multiplication */
	    print q;
	    print "-------------  R Results  --------------------";
	    submit / R;
	          rx <- matrix( 1:3, nrow=1)             # vector of sequence 1,2,3
	          rm <- matrix( 1:9, nrow=3, byrow=TRUE) # 3 x 3 matrix
	          rq <- rm %*% t(rx)                     # matrix multiplication
	      print(rq)
	    endsubmit;
    quit;
```




![image](https://github.com/DW-AN/sas-to-r/assets/64296207/adf55e1e-1f78-4498-9e97-32f721f211ff)



