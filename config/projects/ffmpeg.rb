name 'gina-ffmpeg'
maintainer 'UAF GINA'
homepage 'gina.alaska.edu'

install_path    '/opt/ffmpeg'
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# ffmpeg dependencies/components
dependency 'ffmpeg'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
