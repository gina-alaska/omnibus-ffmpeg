name "vo-aacenc"
default_version "0.1.2"


source url: "http://downloads.sourceforge.net/opencore-amr/vo-aacenc-0.1.2.tar.gz",
       md5: "cc862dce14ea5d688506904160c65a02"

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
