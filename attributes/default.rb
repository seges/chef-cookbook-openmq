default[:openmq][:user] = "openmq"
default[:openmq][:group] = "openmq"

default[:openmq][:version] = "4.5"
default[:openmq][:archive_file] = "openmq4_5-binary-Linux_X86.zip"
default[:openmq][:url] = "http://download.java.net/mq/open-mq/#{default[:openmq][:version]}/b29-fcs/#{default[:openmq][:archive_file]}"

default[:openmq][:install_dir] = "/usr/local"
