FROM debian:10-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y

# Install wkhtmltopdf dependencies
RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget
RUN apt-get update && apt-get install -y --no-install-recommends xvfb libfontconfig libjpeg62-turbo xfonts-75dpi fontconfig

# Download and install wkhtmltopdf
RUN wget --no-check-certificate https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb
RUN dpkg -i wkhtmltox_0.12.6-1.buster_amd64.deb
RUN rm wkhtmltox_0.12.6-1.buster_amd64.deb