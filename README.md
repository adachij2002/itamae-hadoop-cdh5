Itamae cookbooks for Hadoop CDH5
===============

## How to use
#### Install Hadoop CDH5
`
$ itamae ssh -h vm-centos-dev -u root -y nodes/cdh5_all/minimal.yml roles/cdh5_all/default.rb
`

#### Create Hadoop local directories
`
$ itamae ssh -h vm-centos-dev -u root -y nodes/cdh5_all/minimal.yml roles/cdh5_all/mkdir_local.rb
`

#### DryRun
`
$ itamae ssh -h vm-centos-dev -u root -y nodes/cdh5_all/minimal.yml -l debug --dry-run roles/cdh5_all/default.rb
`
