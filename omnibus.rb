#
# This file is used to configure the ffmpeg project. It contains
# come minimal configuration examples for working with Omnibus. For a full list
# of configurable options, please see the documentation for +omnibus/config.rb+.
#

# Build internally
# ------------------------------
# By default, Omnibus uses system folders (like +/var+ and +/opt+) to build and
# cache compontents. If you would to build everything internally, you can
# uncomment the following options. This will prevent the need for root
# permissions in most cases. You will also need to update the ffmpeg
# project configuration to build at +./local/omnibus/build+ instead of
# +/opt/ffmpeg+
#
# cache_dir              './local/omnibus/cache'
# install_path_cache_dir './local/omnibus/cache/install_path'
# source_dir             './local/omnibus/src'
# build_dir              './local/omnibus/build'
# package_dir            './local/omnibus/pkg'
# package_tmp            './local/omnibus/pkg-tmp'

# Enable S3 asset caching
# ------------------------------
# use_s3_caching true
# s3_access_key  'something'
# s3_secret_key  'something'
# s3_bucket      'some-bucket'

# Customize compiler bits
# ------------------------------
# solaris_compiler 'gcc'
build_retries 1
append_timestamp false
