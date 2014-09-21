---
title       : Son's Height Prediction from Father's Height
subtitle    : Shiny Product
author      : Yuyuan Dai
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
## Introduction

The Son's Height Prediction from Father's height was based on linear model fitting Pearson's data set on heights of fathers and their sons. With this model, we can predict son's height range from father's height. 


---

The equation for the calculation was from the linear model below.

```r
library(UsingR)
```

```
## Warning: package 'UsingR' was built under R version 3.1.1
```

```
## Loading required package: MASS
## Loading required package: HistData
```

```
## Warning: package 'HistData' was built under R version 3.1.1
```

```
## Loading required package: Hmisc
```

```
## Warning: package 'Hmisc' was built under R version 3.1.1
```

```
## Loading required package: grid
## Loading required package: lattice
## Loading required package: survival
## Loading required package: splines
## Loading required package: Formula
```

```
## Warning: package 'Formula' was built under R version 3.1.1
```

```
## 
## Attaching package: 'Hmisc'
## 
## The following objects are masked from 'package:base':
## 
##     format.pval, round.POSIXt, trunc.POSIXt, units
## 
## Loading required package: aplpack
```

```
## Warning: package 'aplpack' was built under R version 3.1.1
```

```
## Loading required package: tcltk
## Loading required package: quantreg
```

```
## Warning: package 'quantreg' was built under R version 3.1.1
```

```
## Loading required package: SparseM
```

```
## Warning: package 'SparseM' was built under R version 3.1.1
```

```
## 
## Attaching package: 'SparseM'
## 
## The following object is masked from 'package:base':
## 
##     backsolve
## 
## 
## Attaching package: 'quantreg'
## 
## The following object is masked from 'package:Hmisc':
## 
##     latex
## 
## The following object is masked from 'package:survival':
## 
##     untangle.specials
## 
## 
## Attaching package: 'UsingR'
## 
## The following object is masked from 'package:survival':
## 
##     cancer
```

```r
library(caret)
```

```
## Warning: package 'caret' was built under R version 3.1.1
```

```
## Loading required package: ggplot2
```

```
## Warning: package 'ggplot2' was built under R version 3.1.1
```

```
## 
## Attaching package: 'ggplot2'
## 
## The following object is masked from 'package:UsingR':
## 
##     movies
## 
## 
## Attaching package: 'caret'
## 
## The following object is masked from 'package:survival':
## 
##     cluster
```

```r
data(father.son)
model<-lm(sheight ~ fheight, data=father.son)
model$coef
```

```
## (Intercept)     fheight 
##     33.8866      0.5141
```

---

The input limit for father's height was based on the min and max in Pearson's data set on heights of fathers and their sons. I set the range for the input is 40 to 80 inches as two decimals. 


```r
summary(father.son$fheight)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    59.0    65.8    67.8    67.7    69.6    75.4
```

---

The function for calculating son's height range is the following:


```r
sheight<-function(input){
newdata<-data.frame(fheight=input)
pred<-predict(model, newdata, interval="predict")
pred
}
```

For our example (father's height = 45 inches) the diagnostic would be:


```r
sheight( 45 )
```

```
##     fit   lwr   upr
## 1 57.02 52.09 61.95
```

---
## Conclusion

The son's height prediction was based on the previous dataset. I used a very simple linear regression model to fit Pearson's data set on heights of fathers and their sons. Based on the linear model, we can get an estimated range of son's height.
---
