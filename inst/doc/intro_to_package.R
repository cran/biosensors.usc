## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(biosensors.usc)

## ----file1--------------------------------------------------------------------
file1 = system.file("extdata", "data_1.csv", package = "biosensors.usc")

## ----file2--------------------------------------------------------------------
file2 = system.file("extdata", "variables_1.csv", package = "biosensors.usc")

## ----data1--------------------------------------------------------------------
data1 = load_data(file1, file2)
class(data1)
names(data1)

## -----------------------------------------------------------------------------
another_data_example = generate_data(n=100, Qp=100, Xp=5)
head(another_data_example$variables)
plot(another_data_example$quantiles, main="Simulated data")

## ----wass, fig.width=6, fig.height=4------------------------------------------
regm = regmod_regression(data1, "BMI")

## ----xpred, fig.width=6, fig.height=4-----------------------------------------
xpred = as.matrix(25)
pred = regmod_prediction(regm, xpred)

## ----ridg, fig.width=6, fig.height=4------------------------------------------
ridg = ridge_regression(data1, "BMI")

## ----nada, fig.width=6, fig.height=4------------------------------------------
nada = nadayara_regression(data1, "BMI")

## ---- fig.width=6, fig.height=4-----------------------------------------------
npre = nadayara_prediction(nada, t(colMeans(data1$quantiles$data)))

## ----data2--------------------------------------------------------------------
file3 = system.file("extdata", "data_2.csv", package = "biosensors.usc")
file4 = system.file("extdata", "variables_2.csv", package = "biosensors.usc")
data2 = load_data(file3, file4)

## ----htest--------------------------------------------------------------------
htest = hypothesis_testing(data1, data2)

## -----------------------------------------------------------------------------
print(htest$energy_pvalue)
print(htest$anova_pvalue)

## ----clus, fig.width=6, fig.height=8------------------------------------------
clus = clustering(data1, clusters=3)

## -----------------------------------------------------------------------------
assignments = clustering_prediction(clus, data1$quantiles$data)

