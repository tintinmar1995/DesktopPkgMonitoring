require("pkgsearch")
# library("topicmodels")

packages = c("AUC", "Amelia", "DT", "EIX", "FNN", "FactoMineR", "GGally", "Geo", "Graphiques", "Hmisc", "MASS", "MLmetrics", "Matching", "Matrix", "Metrics", "ModelMetrics", "OSRcppM", "PRROC", "PerformanceAnalytics", "R6", "RColorBrewer", "RJSONIO", "RMySQL", "ROCR", "ROI", "ROI.plugin.glpk", "ROSE", "RPostgreSQL", "TSclust", "TSdist", "VIM", "WriteXLS", "ach", "agricolae", "animation", "base64enc", "bayesplot", "bayestestR", "bit64", "bit64readxl", "broom", "bsts", "caret", "cartography", "classInt", "cluster", "cmprsk", "cobalt", "colorRamps", "colorspace", "colourpicker", "compare", "corrplot", "crosstalk", "dashboardthemes", "data.table", "datamods", "datatools", "dbscan", "dendextend", "did", "doFuture", "doMC", "doParallel", "doRNG", "doSNOW", "dplyr", "dtwclust", "dygraphs", "e1071", "echarts4r", "effects", "expm", "fable", "fabletools", "factoextra", "filesstrings", "finalfit", "fitdistrplus", "flexdashboard", "flextable", "foreach", "fpc", "fpp2", "fpp3", "fst", "future", "future.apply", "gamlss", "geojsonio", "geomnet", "ggcorrplot", "ggdendro", "ggplot2", "ggplotify", "ggpubr", "ggrepel", "ggridges", "ggwordcloud", "glmnet", "glue", "grid", "gridExtra", "gt", "gtsummary", "h2o", "haven", "heatmaply", "here", "hrbrthemes", "htmltools", "htmlwidgets", "httr", "igraph", "impactAnalysis", "janitor", "jsonlite", "kableExtra", "keyring", "kknn", "knitr", "ks", "latex2exp", "leaflet", "leaflet.extras", "leaflet.minicharts", "lemon", "linprog", "lubridate", "magrittr", "manipulateWidget", "maptools", "mapview", "markdown", "matrixStats", "mclust", "mice", "microbenchmark", "missForest", "missMDA", "mlogit", "mongolite", "naniar", "nloptr", "nnetsauce", "nominatim", "np", "officer", "ompr", "ompr.roi", "openxlsx", "pROC", "pander", "parallel", "parallelDist", "party", "pckpdist", "pdist", "photon", "pipeR", "pivottabler", "plotly", "plotrix", "pracma", "proxy", "psych", "purrr", "quadprog", "quantable", "quanteda", "questionr", "rAmCharts", "ramify", "randomForest", "ranger", "raster", "readr", "readxl", "renv", "reshape", "reshape2", "rgdal", "rgeos", "rhdf5", "rjson", "rlang", "rlist", "rmapshaper", "rmarkdown", "rmongodb", "rpart", "rpivotTable", "rpostgis", "rsconnect", "rstanarm", "rvest", "rvg", "scales", "scrypt", "sdcMicro", "sf", "shiny", "shinyFiles", "shinyTime", "shinyWidgets", "shinybatch", "shinycssloaders", "shinydashboard", "shinydashboardPlus", "shinyjs", "shinymanager", "shinymodules", "shinystan", "signalsClust", "smooth", "sp", "spData", "sparkline", "splines2", "sqldf", "stargazer", "stats", "stringr", "survival", "svglite", "systemfonts", "tabulizer", "tibble", "tictoc", "tidyr", "tidytext", "tidyverse", "tm", "tmap", "transport", "tsibble", "tsibbledata", "vdiffr", "vertexenum", "viridis", "visNetwork", "wordcloud2", "writexl", "xgboost", "xml2", "xts", "yaml", "zoo")
notfound = c()

metadata = lapply(packages, function(x){tryCatch({pkgsearch::cran_package(x)}, error = function(e) notfound <<- c(notfound, x))})

s = pkgsearch::cran_package("AUC")


desc = lapply(metadata, function(x){
  tryCatch({x[['Description']]}, error = function(e) print(e))
})

topicmodels::get_terms(desc)
res = topicmodels::LDA(as.character(desc), k = 2, control = list(seed = 1234))

###########################

install.packages("pacdep")
library(pacdep)

# Analyze the dependencies of your project
dep_graph <- dep_graph("../../optimcart-simple-ui/")

# Print the list of packages used
print(dep_graph$packages)

