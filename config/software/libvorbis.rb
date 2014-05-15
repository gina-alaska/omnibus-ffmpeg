name "libvorbis"
default_version "1.3.3"


source url: "http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.3.tar.gz",
       md5: "6b1a36f0d72332fae5130688e65efe1f"

relative_path "libvorbis-#{version}"

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
