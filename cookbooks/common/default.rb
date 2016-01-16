common_packages = ["wget"]

common_packages.each do |pkg|
  package pkg do
    action :install
  end
end
