FROM r-base:latest

RUN apt-get update && apt-get install -y -t unstable \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev/unstable \
    libxt-dev \
    libudunits2-dev

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y libssl-dev libpng-dev vim

# Set the CRAN mirror
RUN echo "local({\n  r <- getOption(\"repos\")\n\
  r[\"CRAN\"] <- \
  \"https://cran.r-project.org\"\n\
  options(repos = r)\n\
  })\n" >> /etc/R/Rprofile.site

COPY install_core_packages.R /code/install_core_packages.R
RUN R -f /code/install_core_packages.R

RUN apt-get install -y libxml2 libxml2-dev
