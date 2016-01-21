# puppet agent version
# perfecto25-nginx
#

Facter.add('puppet_agent_version') do
  confine :kernel => 'Linux'
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/puppet agent --version')
  end
end

