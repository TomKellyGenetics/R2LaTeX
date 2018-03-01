[![Travis-CI Build Status](https://travis-ci.org/TomKellyGenetics/R2LaTeX.svg?branch=master)](https://travis-ci.org/TomKellyGenetics/R2LaTeX)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/TomKellyGenetics/R2LaTeX?branch=master&svg=true)](https://ci.appveyor.com/project/TomKellyGenetics/R2LaTeX)

R2LaTeX: R package to export LaTeX tables
===================

R package to produce a LaTeX table from one or more R object(s) into the R working directory as TeX files names as they are in the R working environment. 

To get the current released version from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/R2LaTeX", ref="master")
```

# Running

R2LaTeX takes any data matrix or dataframe and formats as a TeX table, strings (including rownames and factors) and numerics (including integers) are automatically detected and formatted appropriately, including spaces in rownames and significant digits for numerics. `export_to_latex` exports a single R object into a tex file, this is called by `export_to_latex_loop` to repeat this procedure for a character vector of objects including output of ls().

# Example
```R
export_to_latex(example)
% latex table generated in R 3.2.4 by xtable 1.8-2 package
% Tue Apr  5 16:40:56 2016
\begin{table}[ht]
\centering
\begin{tabular}{rrll}
  \hline
 & c.1..2..3. & c..hello....hey....hi.. & c.T..F..T. \\ 
  \hline
1 &   1 & hello & TRUE \\ 
  2 &   2 & hey & FALSE \\ 
  3 &   3 & hi & TRUE \\ 
   \hline
\end{tabular}
\end{table}
```

```R
export_to_latex_loop(ls())
```
