# Docker image inglebard/ubuntu-sandbox
Docker repository originaly created to chroot a web server remote access and use as sandbox.
[Github](https://github.com/Inglebard/ubuntu-sandbox)
[Dockerhub](https://hub.docker.com/r/inglebard/ubuntu-sandbox/)

## Tags Supported :
* [`latest`](https://github.com/Inglebard/ubuntu-sandbox/blob/master/Dockerfile)
* [`17.04`](https://github.com/Inglebard/ubuntu-sandbox/blob/17.04/Dockerfile)
* [`16.10`](https://github.com/Inglebard/ubuntu-sandbox/blob/16.10/Dockerfile)
* [`16.04`](https://github.com/Inglebard/ubuntu-sandbox/blob/16.04/Dockerfile)


## Why use this image :

This image is fast and easy to use to make a chroot/sandbox. It was originaly created to chroot a web server remote access and use as sandbox.

## Technical information :

### Users :
* root : full access
* user : standard user

### Softwares :
* openssh (root login allowed)
* proftpd (root allowed, with ftp and sftp support)
* mysql client (mysqldump,...)

### Ports :
* 21 : ftp
* 22 : ssh
* 23 : sftp throught proftpd
* 49000-49010 are not exposed because it must be manually. (port must be the same between the container and the host)

### Environnment variables :

* USER_PASSWD : user password (default: ubuntu)
* ROOT_PASSWD : root password (default: ubuntu)
* FTP_PORT_PASS_START : begin of ftp port (default: 49000) 
* FTP_PORT_PASS_END : end of ftp port (default: 49010)

## How to use this image :

You can run this image like this:
```
docker run -it inglebard/ubuntu-sandbox
```

Or use all the option : 
```
docker run -it -p 2222:22 -p 2323:23 -p 2121:21 -p 30000-30010:30000-30010 -e ROOT_PASSWD=passwdroot -e USER_PASSWD=passwduser -e FTP_PORT_PASS_START=30000 -e FTP_PORT_PASS_END=30010 inglebard/ubuntu-sandbox
```

For example, if you want to access to mysql host : 
```
docker run -it  -v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock -p 2222:22 -p 2323:23 -p 2121:21 -p 30000-30010:30000-30010 -e ROOT_PASSWD=passwdroot -e USER_PASSWD=passwduser -e FTP_PORT_PASS_START=30000 -e FTP_PORT_PASS_END=30010 inglebard/ubuntu-sandbox
```
