name "libtheora"
default_version "1.1.1"


source url: "http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2",
       md5: "292ab65cedd5021d6b7ddd117e07cd8e"

relative_path "libtheora-#{version}"

dependency "libogg"
dependency "libvorbis"
# depends "libSDL"

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
