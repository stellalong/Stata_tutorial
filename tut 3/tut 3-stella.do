*cd "C:\Users\stellalong\OneDrive - CUHK-Shenzhen\econ 3211 policy evaluation\Tut 3"

//APPENDING NEW DATA
webuse odd1.dta, clear
save odd1, replace
*browse  
webuse even, clear
*browse 
append using "odd1.dta", gen(filenum) //"filenum" tracks the origin 
*compare with the example in the pdf. 

//MERGING TWO DATASETS TOGETHER 
webuse autosize, clear 
save autosize, replace 
webuse autoexpense, clear 
* ctrl + D = click Do button  
merge 1:1 make using "autosize.dta", gen(filenum) 
*browse 
*draw a venn graph here to show the comparison between append and merge 

*many-to-one merge (only changes 1:1 into m:1) 
*see the graph in pdf. 

//Data visualization 
sysuse auto, clear 
*mpg is a variable. 
*foreign and rep78 are variables.  

//single variable, continuous  
histogram mpg, width(5) freq kdensity kdenopts(bwidth(5))

kdensity mpg, bwidth(3)

//single variable, discrete   
graph bar (count), over(foreign, gap(*0.5)) intensity(*0.5)

graph bar (percent), over(rep78) over(foreign) 

//two+ variables, continuous
graph matrix mpg price weight, half

twoway scatter mpg weight, jitter(7)

twoway scatter mpg weight, mlabel(mpg)

twoway connected mpg price, sort(price)

twoway area mpg price, sort(price) 
*don't worry. click click 

//Plot regression coefficients 
*sysuse auto, clear 
ssc install coefplot 
regress price mpg headroom trunk length turn // we could define local marco here if the variables are utilized frequently 
coefplot, drop(_cons) xline(0)  


//Juxtapose and Overlaying graphs (plot placement)
twoway scatter mpg price, by(foreign, norescale) 

graph twoway scatter mpg price in 27/74 || scatter mpg weight //combine twoway plots using ||

graph combine plot1.gph plot2.gph //combine two or more saved graphs into a single plot 

scatter y3 y2 y1 x, msymbol(i o i) mlabel(var3 var2 var1) //plot several y values for a single x value

//The Graph Editor 
*1. right click the graph to change anything you like to change Or
twoway scatter mpg price, play(graphEditorTheme) //2. by option , play(graphEditorTheme) 


//Save plots 
*Click in the graph window to save the picture/ export to PDF Or 
*Below learn by yourself 
graph twoway scatter y x, saving("myPlot.gph") replace //1. drawing and saving at one time 
graph save "myPlot.gph", replace //2. plotting first then save 
graph export "myPlot.pdf", as(.pdf) //3. export to PDF 