# Use multi stage docker feature.
FROM busybox AS build_env

# 1. Make work directory at first.
WORKDIR /multistage

# 2. Copy
COPY ./files/multi_stage_docker_file .
RUN ls -al /multistage


# Second docker definition.
FROM ubuntu:16.04

# 3. Make work directory at first.
WORKDIR /copy

# 4. Copy normal file.
COPY ./files/not_archived_file .
RUN ls -al /copy

# 5. Copy normal file.
COPY --from=build_env /multistage/multi_stage_docker_file .
RUN ls -al /copy

# 6. NOT Uncompress and unarchive tar files.
COPY ./files/tar_bzip2_file.tar.bzip2 ./files/tar_file.tar ./files/tar_file.tar ./files/tar_gz_file.tar.gz ./files/tar_xz_file.tar.xz ./
RUN ls -al /copy

# 7. NOT unarchive compressed files.
COPY ./files/bzip2_file.bz2 ./files/gzip_file.gz ./files/xz_file.xz ./files/zip_file.zip ./
RUN ls -al /copy

# 8. Copy directory.
COPY ./files ./files
RUN ls -al /copy/files
