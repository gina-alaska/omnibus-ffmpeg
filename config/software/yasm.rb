name "yasm"
default_version "1.2.0"

source url: "http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz",
	   md5: "4cfc0686cf5350dd1305c4d905eb55a6"
relative_path "#{name}-#{version}"

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
