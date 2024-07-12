# 기반 이미지 설정
FROM nvcr.io/nvidia/l4t-pytorch:r35.2.1-pth2.0-py3

# 필수 패키지 설치 전 업데이트
RUN apt-get update && apt-get install -y \
    libgeos++-dev \
    libmysqlcppconn-dev \
    libeigen3-dev \
    libcurl4-openssl-dev \
    gdb \
    libyaml-cpp-dev \
    nlohmann-json3-dev \
    curl zip unzip tar \
    libssl-dev \
    ninja-build

# 설치 후 불필요한 캐시 삭제
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV VCPKG_FORCE_SYSTEM_BINARIES=1
