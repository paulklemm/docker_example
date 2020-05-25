FROM r-base:3.6.3

RUN apt-get -qq update && \
  # fix-broken: https://askubuntu.com/questions/1077298/depends-libnss3-23-26-but-23-21-1ubuntu4-is-to-be-installed
  DEBIAN_FRONTEND=noninteractive apt-get -qy install -f \
  # ggraph dependency (required for clusterProfiler)
  libudunits2-dev \
  # XML2 dependency (required for tidyverse)
  libxml2-dev \
  # httr dependency (required for tidyverse)
  libssl-dev \
  # curl dependency (required for tidyverse)
  libcurl4-openssl-dev \
  # Required for rjava
  default-jdk \
  r-cran-rjava \
  && apt-get clean

# Configure java for R
RUN R CMD javareconf

