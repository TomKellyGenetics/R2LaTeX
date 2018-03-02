#' An Export Function to produce a LaTeX table
#'
#' Exports the R data object into a tex file with the same name as in the R working environment (into the current working directory). Automatically detects integers, strings, and numerics automatically formatting accordingly as string or numerical (with significant figures). Allows formatting of spaces in rownames.
#' @param x Data matrix or Data Frame to be exported into a tex table.
#' @keywords dataframe, matrix, LaTeX, tex, table
#' @import xtable
#' @export
#' @examples
#' data <- rnorm(500, 50, 10)
#' rownames(data) <- 1:50
#' colnames(data) <- letters[1:10]
#'
#' export_to_latex(data)
#'
#' example <- cbind(c(1,2,3), c("A", "B", "C"), c(TRUE, FALSE, TRUE)))
#' export_to_latex(example)
#' @return
#' % latex table generated in R 3.2.4 by xtable 1.8-2 package
#' % Tue Apr  5 16:40:56 2016
#' \begin{table}[ht]
#' \centering
#' \begin{tabular}{rrll}
#' \hline
#' & c.1..2..3. & c..A....B....C.. & c.T..F..T. \\
#' \hline
#' 1 &   1 & A & TRUE \\
#' 2 &   2 & B & FALSE \\
#' 3 &   3 & C & TRUE \\
#' \hline
#' \end{tabular}
#' \end{table}
export_to_latex <-
function(x){
  df <- as.data.frame(x)
  rownames(df) <- make.unique(as.character(rownames(df)), sep="_")
  clx <- unlist(lapply(df, class))
  disp <- rep(NULL, length(clx))
  for(ii in 1:length(clx)){
    if(clx[ii] == "numeric") disp[ii] <- "g"
    if(clx[ii] == "complex") disp[ii] <- "g"
    if(clx[ii] == "integer") disp[ii] <- "d"
    if(clx[ii] == "factor") disp[ii] <- "s"
    if(clx[ii] == "character") disp[ii] <- "s"
    if(clx[ii] == "logical") disp[ii] <- "s"
  }
  disp <- c("s", disp) #add rownames
  print(xtable(df, display=disp), type="latex", file=paste0(deparse(substitute(x)), ".tex"))
}
