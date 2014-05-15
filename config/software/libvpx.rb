name "libvpx"
default_version "1.3.0"


source url: "https://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2",
       md5: "14783a148872f2d08629ff7c694eb31f"

relative_path "libvpx-v#{version}"

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
