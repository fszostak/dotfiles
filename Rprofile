# The .First function is called after everything else in .Rprofile is executed
.First <- function() {
  # Print a welcome message
    message("Welcome back ", Sys.getenv("USER"),"!\n","Working directory is ", getwd())
}

# Always load the 'methods' package
library(methods)

# Load the devtools and colorout packages if in interactive mode
  if (interactive()) {
    library(devtools)
      library(colorout)
  }
