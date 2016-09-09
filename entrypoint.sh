if [ ! -z ${FTP_PORT_PASS_START} ] && [ ! -z ${FTP_PORT_PASS_END} ]; then
	printf    "<Global>\n\
	PassivePorts ${FTP_PORT_PASS_START} ${FTP_PORT_PASS_END}\n\
</Global>\n" > /etc/proftpd/conf.d/global-dynamic.conf
fi

if [ ! -z ${USER_PASSWD} ]; then
	echo "user:${USER_PASSWD}" | chpasswd
fi

if [ ! -z ${ROOT_PASSWD} ]; then
	echo "root:${ROOT_PASSWD}" | chpasswd
fi
unset USER_PASSWD
unset ROOT_PASSWD

/usr/sbin/sshd
/usr/sbin/proftpd
bash
