# Hexsticker

Create a hexsticker from R using Shiny.

## Development

Run `bin/docker-build.sh` to build the Docker containers (once).
Run `bin/docker-run.sh` to start container. RStudio will be accessible in browser using `http://localhost:8787` with login & password: `rstudio`. Files from this repository will be visible from RStudio using `/mnt` directory. All changes will be visible on the host system.
