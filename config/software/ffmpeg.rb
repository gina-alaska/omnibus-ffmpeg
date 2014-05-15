# This is an example software definition for a C project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "ffmpeg"
default_version "2.2"

dependency "zlib"
dependency "yasm"
dependency "libmp3lame"
dependency "libtheora"
dependency "libvorbis"
dependency "vo-aacenc"
dependency "libvpx"
dependency "libx264"

source git: "git://github.com/FFmpeg/FFmpeg"

relative_path 'FFmpeg'

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command [
   "./configure",
   "--yasmexe=#{install_dir}/embedded/bin/yasm",
   "--prefix=#{install_dir}",
   "--enable-gpl",
   "--enable-libmp3lame",
   "--enable-libtheora",
   "--enable-libvo-aacenc", 
   "--enable-libvorbis",
   "--enable-libvpx",
   "--enable-libx264",
   "--enable-version3"].join(" "), :env => env

  command "make -j #{max_build_jobs}", :env => env
  command "make install"
end
