#Puppet Module for NGINX web server
###written by Mike Reider for practice
###Jan 20, 2016
--
sources used to build nginx module:

http://nginx.org/en/docs/beginners_guide.html

### Compatible Operating Systems:
CentOS/RedHat 6,7
Ubuntu 12,14

### Puppet Version compatibility
PE 3.8 and greater

### NOTICE:
if running SELinux for CentOS/Redhat/Fedora/Ubuntu/Debian, make sure to disable or lower to permissive, otherwise port 8000 wont bind correctly

## How to use this module:
clone this repository to your modules directory,

To change specific parameters like binding port # or user names, open up /manifests/params.pp and change the values there

###To assign your node with Nginx class:

####from Site.pp

node YourNode { include nginx }

####from Hiera

nodeName.yaml
classes:
   - nginx



