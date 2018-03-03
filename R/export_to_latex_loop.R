#' An Export Function to produce LaTeX tables for many objects simultaneously
#'
#' Calls \code{\link[R2LaTeX]{export_to_latex}} for every objects given. Exports the R data object into a tex file with the same name as in the R working environment (into the current working directory). Automatically detects integers, strings, and numerics automatically formatting accordingly as string or numerical (with significant figures). Allows formatting of spaces in rownames.
#' @param object_list string or character vector. Names of objects (data matrices or data frames) to be exported as LaTeX tables with names assigned in the R working environment. This is compatible with the output of ls() and any grep() searches of it.
#' @keywords dataframe, matrix, LaTeX, tex, table
#' @export
#' @examples
#' data_matrix <- matrix(rnorm(500), 50, 10)
#' rownames(data_matrix) <- 1:50
#' colnames(data_matrix) <- letters[1:10]
#' 
#' data_frame <- as.data.frame(matrix(rnorm(1200), 60, 20))
#' rownames(data_frame) <- 1:60
#' colnames(data_frame) <- letters[1:20]
#'
#' objects <- c("data_matrix", "data_frame")
#'
#' export_to_latex_loop(objects)
#'
export_to_latex_loop <-
function(object_list){
  for(ii in 1:length(object_list)){
    print(class(get(object_list[ii])))
    if (is.data.frame(get(object_list[ii])) || is.matrix(get(object_list[ii]))){
      command <- paste0('export_to_latex(', object_list[ii], ")")
      eval(parse(text=command))
      } else {
        warning("This function only takes matrix or dataframe inputs")
      }
    print(command)
  }
}
