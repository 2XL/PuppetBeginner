
node "slave1" {
file{
'/tmp/hello' :
content => "Hello, World!\n
I'm slave1!"
}
}
node "slave2" {
file{
'/tmp/hello' :
content => "Hello, World!\n
I'm slave2!"
}
}
