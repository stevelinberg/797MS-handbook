# Create the chapter pages. Do not overwrite.

library(tidyverse)

chapters <- c(
  "Simple linear regression",
  "Multiple linear regression",
  "Logistic regression",
  "Multiple logistic regression",
  "Linear discriminant analysis",
  "Quadratic discriminant analysis",
  "Naive Bayes",
  "K-Nearest Neighbors",
  "Poisson regression",
  "Cross-validation",
  "Bootstrap",
  "Best subset selection",
  "Stepwise selection",
  "Ridge regression",
  "Lasso",
  "Principal component regression",
  "Bagging",
  "Random forests",
  "Boosting",
  "Bayesian Additive Regression Trees",
  "Support Vector Machines",
  "Principal component analysis",
  "K-means clustering",
  "Hierarchical clustering"
)

base_template <- "# TITLE {#REF}

## TL;DR

What it does
: TODO

When to do it
: TODO

How to do it
: TODO

How to assess it
: TODO

## What it does

TODO

## When to do it

TODO

## How to do it

TODO

## How to interpret the output

TODO

## Where to learn more

TODO
"

for (chap in chapters) {
  chap_title <- str_to_title(chap)
  chap_ref <- str_to_lower(str_replace_all(chap, "\\W", "-"))
  chap_filename <- paste0(str_replace_all(chap_ref, "-", "_"), ".Rmd")

  if (!file.exists(chap_filename)) {
    cat("Creating file", chap_filename, "\n")
    output_text <- str_replace_all(base_template,
                                   c("TITLE" = chap_title,
                                     "REF" = chap_ref))
    writeLines(output_text, chap_filename)
  }
}
