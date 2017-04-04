install.packages("devtools")

library(devtools)

install_version("shiny", version = "0.14.2", type = "source")
install_version("shinyjs", version = "0.8", type = "source")
install_version("colourpicker", version = "0.3", type = "source")
install_version("magrittr", version = "1.5", type = "source")


try_eval <- function(...){
  tryCatch({ eval(...); TRUE }, error = function(x) { FALSE })
}

retry <- function(..., times = 3) {
  print("Trying to instal...")
  while(times > 0 & !try_eval(...)) {
    times <- times - 1
  }
}

curl::nslookup("github.com") # Workaround for DNS problems -- query github so DNS resolution is cached before we install.
retry(install_github('Appsilon/shiny.semantic'))

source("https://bioconductor.org/biocLite.R")
biocLite("EBImage")

retry(install_github('GuangchuangYu/hexSticker'))
