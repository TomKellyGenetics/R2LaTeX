#' An Export Function to produce LaTeX tables for many objects simultaneously
#'
#' Calls \code{\link[R2LaTeX]{export_to_latex}} for every objects given. Exports the R data object into a tex file with the same name as in the R working environment (into the current working directory). Automatically detects integers, strings, and numerics automatically formatting accordingly as string or numerical (with significant figures). Allows formatting of spaces in rownames.
#' @param object_list string or character vector. Names of objects (data matrices or data frames) to be exported as LaTeX tables with names assigned in the R working environment. This is compatible with the output of ls() and any grep() searches of it.
#' @keywords dataframe, matrix, LaTeX, tex, table
#' @export
#' @examples
#' data <- matrix(rnorm(500), 50, 10)
#' rownames(data) <- 1:50
#' colnames(data) <- letters[1:10]
#' 
#' table <- matrix(rnorm(1200), 60, 20)
#' rownames(data) <- 1:50
#' colnames(data) <- letters[1:20]
#'
#' objects <- c("data", "table")
#'
#' export_to_latex_loop(objects)
#'
export_to_latex_loop <-
function(object_list){
  for(command in paste0('export_SL_latex(', object_list, ")")){
    eval(parse(text=command))
    print(command)
  }
}
