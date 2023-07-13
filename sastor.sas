/* get the SAS data location ====== */
proc sql;
    select path into :dirx
    from dictionary.libnames
    where libname='WORK' and monotonic()=1;
quit;


/* convert the backslash "\" to slash "/"====== */
data path;
x="&dirx.";
y=tranwrd(x,'\','/');
proc print;
run;

proc sql;
    select y into :diry
    from path;
quit;

/*iml to port dir to r ======================*/
proc iml;
  nmd="&diry.";
  submit nmd/ R;
    library(tidyverse)
	library(haven)
	dira=paste0("&nmd",'/datatoread.sas7bdat')
	aa=read_sas(dira)
	colnames(aa)=tolower(colnames(aa))
	print(nrow(aa))
  endsubmit;
quit;
