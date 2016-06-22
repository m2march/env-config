all: ~/.ssh/id_rsa

~/.ssh/id_rsa:
	ssh-keygen -q -f $@ -N ""

