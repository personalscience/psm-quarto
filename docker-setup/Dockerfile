FROM rocker/r-ver:4.3.1

# System dependencies remain the same
RUN apt-get update && apt-get install -y \
    curl \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    zlib1g-dev \
    texlive-xetex \
    texlive-fonts-recommended \
    libgit2-dev \
    r-recommended \  
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto
RUN curl -fsSL https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.39/quarto-1.6.39-linux-arm64.deb -o quarto.deb \
    && dpkg -i quarto.deb \
    && rm quarto.deb

# Set working directory
WORKDIR /usr/src/app

# Copy renv files
COPY renv.lock .
COPY .Renviron .
COPY ./renv ./renv

# Copy your custom packages
COPY ./psmr ./psmr
COPY ./actino ./actino
COPY ./tinytex-0.54 ./tinytex-0.54

COPY . .

# Install renv and restore the environment
RUN Rscript -e "install.packages('renv', repos='https://cran.rstudio.com')" \
    && Rscript -e "Sys.setenv(RENV_CONFIG_CACHE_SYMLINKS = FALSE); renv::restore()"

RUN Rscript -e "tinytex::install_tinytex()"

CMD ["bash"]