common_packages = ["wget", "libcgroup"]

common_packages.each do |pkg|
  package pkg do
    action :install
  end
end
