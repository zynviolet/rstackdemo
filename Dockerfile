FROM rocker/r-base
ADD . /code
WORKDIR /code

# Install dependencies
RUN apt-get update && apt-get -y install \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  libhiredis-dev

# Install R libs here
# redux for connecting to Redis
# plumber for converting R code to API
RUN install2.r --error \
  --repos "https://mirrors.tuna.tsinghua.edu.cn/CRAN/" \
  redux \
  plumber

CMD ["Rscript", "plumber.R"]
