Vagrant.configure('2') do |config|
 config.vm.define :precise64 do |precise64|
  precise64.vm.box = 'precise64'
  precise64.vm.provision :shell, :inline => "sudo apt-get update"
  precise64.vm.provision :shell, :path => "manifests/manifest"
 end
 config.vm.define :slave1 do |slave1|
  slave1.vm.box = 'precise64'
  slave1.vm.provision :shell, :inline => "sudo apt-get update"
  slave1.vm.provision :shell, :path => "manifests/manifest"
  slave1.vm.provision :puppet do |puppet|
   puppet.manifests_path = "manifests"
   puppet.manifest_file = "isite.pp"
   puppet.module_path = "modules"
  end
 end
 config.vm.define :slave2 do |slave2|
  slave2.vm.box = 'precise64'
  slave2.vm.provision :shell, :inline => "sudo apt-get update"
  slave2.vm.provision :shell, :path => "manifests/manifest"
  slave2.vm.provision :puppet do |puppet|
   puppet.manifests_path = "manifests"
   puppet.manifest_file = "isite.pp"
   puppet.module_path = "modules"
  end
 end
end
