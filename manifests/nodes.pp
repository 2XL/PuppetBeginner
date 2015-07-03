
node 'slave1' {
file{
'/tmp/hello' :
content => "Hello, World!\n
I'm slave1!"
}
package{
'nginx' :
ensure => installed
}
package{
'git' :
ensure => installed
}
}
node 'slave2' {
file{
'/tmp/hello' :
content => "Hello, World!\n
I'm slave2!"
}
package{
'nginx' :
ensure => installed
}
package{
'git' :
ensure => installed
}
}
$packages = ['w3m', 'puppet-lint', 'git']
node 'precise64' {
file{
'/tmp/hello' :
content => "Hello, World!\n
I'm precise64!"
}
package{
'nginx' :
ensure => installed
}
package{
$packages: ensure => installed
}
package{
'puppet' :
ensure => latest
}
}
