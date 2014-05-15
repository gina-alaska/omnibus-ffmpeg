# This is an example software definition for a C project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "libmp3lame"
default_version "3.99.5"

source url: "http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz",
       md5: "84835b313d4a8b68f5349816d33e07ce"

relative_path "lame-#{version}"

dependency "ncurses"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command [
   "./configure",
   "--prefix=#{install_dir}/embedded"
  ].join(" "), :env => env

  command "make -j #{max_build_jobs}", :env => env
  command "make install"
end
