library(devtools)

install_version("plotly", version = "4.5.6", type = "source")
install_version("DT", version = "0.2", type = "source")
install_version("urltools", version = "1.6.0", type = "source")
install_version("rex", version = "1.1.1", type = "source")
install_version("stringr", version = "1.1.0", type = "source")
install_version("purrr", version = "0.2.2", type = "source")

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
