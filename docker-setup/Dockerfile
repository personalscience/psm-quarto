# Use a base image with R pre-installed
FROM rocker/r-ver:4.3.1

# Install system dependencies
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
    && apt-get clean

# Install Quarto (ARM64 version)
RUN curl -fsSL https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.39/quarto-1.6.39-linux-arm64.deb -o quarto.deb && \
    dpkg -i quarto.deb && \
    rm quarto.deb

# Set working directory
WORKDIR /usr/src/app

# Copy project files into the container
COPY . /usr/src/app

# Install R packages (renv setup will come later)
RUN R -e "install.packages('renv')"

# Copy the custom psmr package
COPY /Users/sprague/dev/psi/psmr /usr/src/app/psmr

# Install the psmr package
RUN R -e "install.packages('/usr/src/app/psmr', repos = NULL, type = 'source')"

# Restore the renv environment
RUN R -e "renv::restore()"

# Expose port for RStudio (optional, for advanced setup)
EXPOSE 8787

# Default command
CMD ["bash"]
