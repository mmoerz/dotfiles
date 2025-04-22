if [[ -d /var/lib/snapd/snap/bin ]] ; then
	export PATH=$PATH:/var/lib/snapd/snap/bin
fi
if [[ -e /var/lib/snapd/snap/k9s/current/bin ]] ; then 
	export PATH=$PATH:/var/lib/snapd/snap/k9s/current/bin
else 
	echo not found /var/lib/snapd/snap/k9s/current/bin/
fi
