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

### PREREQUISITE STEPS:
- if running SELinux for CentOS/Redhat/Fedora/Ubuntu/Debian, make sure to disable or lower to permissive, otherwise port 8000 wont bind correctly
- Disable Iptables if firewall is running, otherwise port 8000 wont work

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

### Setting up remote repository sync
1. in order to serve up the latest 'index.html' file, you need to install the puppetlabs-vcsrepo module
   on PE Master, run 'puppet module install puppetlabs-vcsrepo'

2. VI the /nginx/manifests/params.pp and update your $modulepath to point to your production modules
   
   $modulepath = "/etc/puppetlabs/code/environments/production/modules"

3. on PE Master, run "puppet apply [modulepath]/nginx/tests/pull_repo.pp"
   
   This will create a cron setting on your PE Master, to pull in the latest index.html from remote git repo. Its set to a default of 15 min, to adjust it open the params.pp and update the value for $git_sync_min

  to check cron settings on your PE Master, run 'crontab -l'
  you should see a setting like this:
  
  # Puppet Name: pullremote
  */15 * * * * /usr/local/bin/puppet apply /etc/puppetlabs/code/environments/production/modules/nginx/tests/pull_remote.pp


4. Your '/nginx/files/repo/index.html' file will now be updated directly from Git every 15 min. 
