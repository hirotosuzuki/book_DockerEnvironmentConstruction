FROM ubuntu:16.04

# 1. Make work directory at first.
WORKDIR /add

# 2. Add normal file.
ADD ./files/not_archived_file .
RUN ls -al /add

# 3. Add remote resource to container.
ADD https://github.com/docker/docker-ce/blob/master/README.md .
RUN ls -al /add

# 4. Uncompress and unarchive tar files.
ADD ./files/tar_bzip2_file.tar.bzip2 ./files/tar_file.tar ./files/tar_file.tar ./files/tar_gz_file.tar.gz ./files/tar_xz_file.tar.xz ./
RUN ls -al /add

# 5. NOT unarchive compressed files.
ADD ./files/bzip2_file.bz2 ./files/gzip_file.gz ./files/xz_file.xz ./files/zip_file.zip ./
RUN ls -al /add

# 6. Add directory.
ADD ./files ./files
RUN ls -al /add/files
