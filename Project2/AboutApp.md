App for Predicting Eshophageal Cancer
========================================================
author: Javier Melo
date: January 22, 2015
font-family: 'Helvetica'



Introduction
========================================================
<head>
<style>
h3 {
    background-color: #b0c4de;
}
</style>
</head>
The purpose of this Shiny App is to predict the probability of Eshophageal Cancer based on esoph dataset. The predictor variables are age, alcohol consumption and tobacco consumption.

- Easy to use: alcohol is entered in numbers of shots per day and tobacco in number of    cigarretes per day
- Quick prediction
- Info tab with instractions and more information about the App
- Link to run the App: http://javiermelo.shinyapps.io/Project1
- Link to esoph data set:  http://stat.ethz.ch/R-manual/R-patched/library/datasets/html/esoph.html


Easy steps to use it!
========================================================
<center>
![alt text](./AboutApp-figure/esophApp.png)

</center>

The Model Used
========================================================

A logistic regression:
<small>

```r
data(esoph)
## logistical model is calculated once
model <- glm(cbind(ncases,ncontrols)~agegp+tobgp*alcgp,
             data=esoph,family=binomial())
```
</small>
The prediction:
<small>

```r
df <- data.frame(agegp="75+",alcgp="120+",tobgp="30+")
predict(model,df,type = "response")
```

```
        1 
0.5742187 
```
</small>

Conversion Factors
========================================================

To make easier the data entry allowing number of shots and cigarretes, the following conversion factors were used:



<head>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>

<center><table>
  <tr>
    <th>Data Entry Units</th>
    <th>Dataset Units</th>
  </tr>
  <tr>
    <td>1 cigarrete</td>
    <td>4gm</td>
  </tr>
  <tr>
    <td>1 shot of alcohol 40% by vol </td>
    <td>14 gm</td>
  </tr>
</table></center>
