
sre@k8s-controller-01:~$ dpkg -l | grep docker
ii  docker.io                            24.0.7-0ubuntu4.1                       amd64        Linux container runtime
sre@k8s-controller-01:~$ find /var/lib/dpkg/ -print | grep docker
/var/lib/dpkg/info/docker.io.list
/var/lib/dpkg/info/docker.io.preinst
/var/lib/dpkg/info/docker.io.prerm
/var/lib/dpkg/info/docker.io.templates
/var/lib/dpkg/info/docker.io.postrm
/var/lib/dpkg/info/docker.io.postinst
/var/lib/dpkg/info/docker.io.md5sums
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.list
/.
/etc
/etc/docker
/usr
/usr/bin
/usr/bin/docker
/usr/bin/docker-init
/usr/bin/docker-proxy
/usr/bin/dockerd
/usr/lib
/usr/lib/systemd
/usr/lib/systemd/system
/usr/lib/systemd/system/docker.service
/usr/lib/systemd/system/docker.socket
/usr/share
/usr/share/bash-completion
/usr/share/bash-completion/completions
/usr/share/bash-completion/completions/docker
/usr/share/doc
/usr/share/doc/docker.io
/usr/share/doc/docker.io/NOTICE
/usr/share/doc/docker.io/README.Debian
/usr/share/doc/docker.io/README.md
/usr/share/doc/docker.io/changelog.Debian.gz
/usr/share/doc/docker.io/copyright
/usr/share/docker.io
/usr/share/docker.io/contrib
/usr/share/docker.io/contrib/check-config.sh
/usr/share/docker.io/contrib/nuke-graph-directory.sh
/usr/share/lintian
/usr/share/lintian/overrides
/usr/share/lintian/overrides/docker.io
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/docker-attach.1.gz
/usr/share/man/man1/docker-build.1.gz
/usr/share/man/man1/docker-builder-build.1.gz
/usr/share/man/man1/docker-builder-prune.1.gz
/usr/share/man/man1/docker-builder.1.gz
/usr/share/man/man1/docker-checkpoint-create.1.gz
/usr/share/man/man1/docker-checkpoint-ls.1.gz
/usr/share/man/man1/docker-checkpoint-rm.1.gz
/usr/share/man/man1/docker-checkpoint.1.gz
/usr/share/man/man1/docker-commit.1.gz
/usr/share/man/man1/docker-config-create.1.gz
/usr/share/man/man1/docker-config-inspect.1.gz
/usr/share/man/man1/docker-config-ls.1.gz
/usr/share/man/man1/docker-config-rm.1.gz
/usr/share/man/man1/docker-config.1.gz
/usr/share/man/man1/docker-container-attach.1.gz
/usr/share/man/man1/docker-container-commit.1.gz
/usr/share/man/man1/docker-container-cp.1.gz
/usr/share/man/man1/docker-container-create.1.gz
/usr/share/man/man1/docker-container-diff.1.gz
/usr/share/man/man1/docker-container-exec.1.gz
/usr/share/man/man1/docker-container-export.1.gz
/usr/share/man/man1/docker-container-inspect.1.gz
/usr/share/man/man1/docker-container-kill.1.gz
/usr/share/man/man1/docker-container-logs.1.gz
/usr/share/man/man1/docker-container-ls.1.gz
/usr/share/man/man1/docker-container-pause.1.gz
/usr/share/man/man1/docker-container-port.1.gz
/usr/share/man/man1/docker-container-prune.1.gz
/usr/share/man/man1/docker-container-rename.1.gz
/usr/share/man/man1/docker-container-restart.1.gz
/usr/share/man/man1/docker-container-rm.1.gz
/usr/share/man/man1/docker-container-run.1.gz
/usr/share/man/man1/docker-container-start.1.gz
/usr/share/man/man1/docker-container-stats.1.gz
/usr/share/man/man1/docker-container-stop.1.gz
/usr/share/man/man1/docker-container-top.1.gz
/usr/share/man/man1/docker-container-unpause.1.gz
/usr/share/man/man1/docker-container-update.1.gz
/usr/share/man/man1/docker-container-wait.1.gz
/usr/share/man/man1/docker-container.1.gz
/usr/share/man/man1/docker-context-create.1.gz
/usr/share/man/man1/docker-context-export.1.gz
/usr/share/man/man1/docker-context-import.1.gz
/usr/share/man/man1/docker-context-inspect.1.gz
/usr/share/man/man1/docker-context-ls.1.gz
/usr/share/man/man1/docker-context-rm.1.gz
/usr/share/man/man1/docker-context-show.1.gz
/usr/share/man/man1/docker-context-update.1.gz
/usr/share/man/man1/docker-context-use.1.gz
/usr/share/man/man1/docker-context.1.gz
/usr/share/man/man1/docker-cp.1.gz
/usr/share/man/man1/docker-create.1.gz
/usr/share/man/man1/docker-diff.1.gz
/usr/share/man/man1/docker-events.1.gz
/usr/share/man/man1/docker-exec.1.gz
/usr/share/man/man1/docker-export.1.gz
/usr/share/man/man1/docker-history.1.gz
/usr/share/man/man1/docker-image-build.1.gz
/usr/share/man/man1/docker-image-history.1.gz
/usr/share/man/man1/docker-image-import.1.gz
/usr/share/man/man1/docker-image-inspect.1.gz
/usr/share/man/man1/docker-image-load.1.gz
/usr/share/man/man1/docker-image-ls.1.gz
/usr/share/man/man1/docker-image-prune.1.gz
/usr/share/man/man1/docker-image-pull.1.gz
/usr/share/man/man1/docker-image-push.1.gz
/usr/share/man/man1/docker-image-rm.1.gz
/usr/share/man/man1/docker-image-save.1.gz
/usr/share/man/man1/docker-image-tag.1.gz
/usr/share/man/man1/docker-image.1.gz
/usr/share/man/man1/docker-images.1.gz
/usr/share/man/man1/docker-import.1.gz
/usr/share/man/man1/docker-info.1.gz
/usr/share/man/man1/docker-inspect.1.gz
/usr/share/man/man1/docker-kill.1.gz
/usr/share/man/man1/docker-load.1.gz
/usr/share/man/man1/docker-login.1.gz
/usr/share/man/man1/docker-logout.1.gz
/usr/share/man/man1/docker-logs.1.gz
/usr/share/man/man1/docker-manifest-annotate.1.gz
/usr/share/man/man1/docker-manifest-create.1.gz
/usr/share/man/man1/docker-manifest-inspect.1.gz
/usr/share/man/man1/docker-manifest-push.1.gz
/usr/share/man/man1/docker-manifest-rm.1.gz
/usr/share/man/man1/docker-manifest.1.gz
/usr/share/man/man1/docker-network-connect.1.gz
/usr/share/man/man1/docker-network-create.1.gz
/usr/share/man/man1/docker-network-disconnect.1.gz
/usr/share/man/man1/docker-network-inspect.1.gz
/usr/share/man/man1/docker-network-ls.1.gz
/usr/share/man/man1/docker-network-prune.1.gz
/usr/share/man/man1/docker-network-rm.1.gz
/usr/share/man/man1/docker-network.1.gz
/usr/share/man/man1/docker-node-demote.1.gz
/usr/share/man/man1/docker-node-inspect.1.gz
/usr/share/man/man1/docker-node-ls.1.gz
/usr/share/man/man1/docker-node-promote.1.gz
/usr/share/man/man1/docker-node-ps.1.gz
/usr/share/man/man1/docker-node-rm.1.gz
/usr/share/man/man1/docker-node-update.1.gz
/usr/share/man/man1/docker-node.1.gz
/usr/share/man/man1/docker-pause.1.gz
/usr/share/man/man1/docker-plugin-create.1.gz
/usr/share/man/man1/docker-plugin-disable.1.gz
/usr/share/man/man1/docker-plugin-enable.1.gz
/usr/share/man/man1/docker-plugin-inspect.1.gz
/usr/share/man/man1/docker-plugin-install.1.gz
/usr/share/man/man1/docker-plugin-ls.1.gz
/usr/share/man/man1/docker-plugin-push.1.gz
/usr/share/man/man1/docker-plugin-rm.1.gz
/usr/share/man/man1/docker-plugin-set.1.gz
/usr/share/man/man1/docker-plugin-upgrade.1.gz
/usr/share/man/man1/docker-plugin.1.gz
/usr/share/man/man1/docker-port.1.gz
/usr/share/man/man1/docker-ps.1.gz
/usr/share/man/man1/docker-pull.1.gz
/usr/share/man/man1/docker-push.1.gz
/usr/share/man/man1/docker-rename.1.gz
/usr/share/man/man1/docker-restart.1.gz
/usr/share/man/man1/docker-rm.1.gz
/usr/share/man/man1/docker-rmi.1.gz
/usr/share/man/man1/docker-run.1.gz
/usr/share/man/man1/docker-save.1.gz
/usr/share/man/man1/docker-search.1.gz
/usr/share/man/man1/docker-secret-create.1.gz
/usr/share/man/man1/docker-secret-inspect.1.gz
/usr/share/man/man1/docker-secret-ls.1.gz
/usr/share/man/man1/docker-secret-rm.1.gz
/usr/share/man/man1/docker-secret.1.gz
/usr/share/man/man1/docker-service-create.1.gz
/usr/share/man/man1/docker-service-inspect.1.gz
/usr/share/man/man1/docker-service-logs.1.gz
/usr/share/man/man1/docker-service-ls.1.gz
/usr/share/man/man1/docker-service-ps.1.gz
/usr/share/man/man1/docker-service-rm.1.gz
/usr/share/man/man1/docker-service-rollback.1.gz
/usr/share/man/man1/docker-service-scale.1.gz
/usr/share/man/man1/docker-service-update.1.gz
/usr/share/man/man1/docker-service.1.gz
/usr/share/man/man1/docker-stack-config.1.gz
/usr/share/man/man1/docker-stack-deploy.1.gz
/usr/share/man/man1/docker-stack-ls.1.gz
/usr/share/man/man1/docker-stack-ps.1.gz
/usr/share/man/man1/docker-stack-rm.1.gz
/usr/share/man/man1/docker-stack-services.1.gz
/usr/share/man/man1/docker-stack.1.gz
/usr/share/man/man1/docker-start.1.gz
/usr/share/man/man1/docker-stats.1.gz
/usr/share/man/man1/docker-stop.1.gz
/usr/share/man/man1/docker-swarm-ca.1.gz
/usr/share/man/man1/docker-swarm-init.1.gz
/usr/share/man/man1/docker-swarm-join-token.1.gz
/usr/share/man/man1/docker-swarm-join.1.gz
/usr/share/man/man1/docker-swarm-leave.1.gz
/usr/share/man/man1/docker-swarm-unlock-key.1.gz
/usr/share/man/man1/docker-swarm-unlock.1.gz
/usr/share/man/man1/docker-swarm-update.1.gz
/usr/share/man/man1/docker-swarm.1.gz
/usr/share/man/man1/docker-system-df.1.gz
/usr/share/man/man1/docker-system-events.1.gz
/usr/share/man/man1/docker-system-info.1.gz
/usr/share/man/man1/docker-system-prune.1.gz
/usr/share/man/man1/docker-system.1.gz
/usr/share/man/man1/docker-tag.1.gz
/usr/share/man/man1/docker-top.1.gz
/usr/share/man/man1/docker-trust-inspect.1.gz
/usr/share/man/man1/docker-trust-key-generate.1.gz
/usr/share/man/man1/docker-trust-key-load.1.gz
/usr/share/man/man1/docker-trust-key.1.gz
/usr/share/man/man1/docker-trust-revoke.1.gz
/usr/share/man/man1/docker-trust-sign.1.gz
/usr/share/man/man1/docker-trust-signer-add.1.gz
/usr/share/man/man1/docker-trust-signer-remove.1.gz
/usr/share/man/man1/docker-trust-signer.1.gz
/usr/share/man/man1/docker-trust.1.gz
/usr/share/man/man1/docker-unpause.1.gz
/usr/share/man/man1/docker-update.1.gz
/usr/share/man/man1/docker-version.1.gz
/usr/share/man/man1/docker-volume-create.1.gz
/usr/share/man/man1/docker-volume-inspect.1.gz
/usr/share/man/man1/docker-volume-ls.1.gz
/usr/share/man/man1/docker-volume-prune.1.gz
/usr/share/man/man1/docker-volume-rm.1.gz
/usr/share/man/man1/docker-volume-update.1.gz
/usr/share/man/man1/docker-volume.1.gz
/usr/share/man/man1/docker-wait.1.gz
/usr/share/man/man1/docker.1.gz
/usr/share/man/man5
/usr/share/man/man5/Dockerfile.5.gz
/usr/share/man/man5/docker-config-json.5.gz
/usr/share/man/man8
/usr/share/man/man8/dockerd.8.gz
/usr/share/zsh
/usr/share/zsh/vendor-completions
/usr/share/zsh/vendor-completions/_docker
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.preinst
#!/bin/sh
set -e

if [ -e "/var/lib/docker/aufs" ]; then
	echo "The aufs storage-driver is no longer supported."
	echo "Please ensure that none of your containers are"
	echo "using the aufs storage driver, remove the directory"
	echo "/var/lib/docker/aufs and try again."
	exit 1
fi


sre@k8s-controller-01:~$ ls -l /var/lib/docker/aufs
ls: cannot access '/var/lib/docker/aufs': Permission denied
sre@k8s-controller-01:~$ sudo /var/lib/docker/aufs
sudo: /var/lib/docker/aufs: command not found
sre@k8s-controller-01:~$ sudo ls -l /var/lib/docker/aufs
ls: cannot access '/var/lib/docker/aufs': No such file or directory
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.preinst
#!/bin/sh
set -e

if [ -e "/var/lib/docker/aufs" ]; then
	echo "The aufs storage-driver is no longer supported."
	echo "Please ensure that none of your containers are"
	echo "using the aufs storage driver, remove the directory"
	echo "/var/lib/docker/aufs and try again."
	exit 1
fi


sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.prerm
#!/bin/sh
set -e

case "$1" in
	remove)
		# if we're removing, we need to save "nuke-graph-directory.sh" so that
		# we can still purge "/var/lib/docker" later if necessary
		# see also docker.io.postrm
		if \
			[ -d /var/lib/docker ] \
			&& [ -x /usr/share/docker.io/contrib/nuke-graph-directory.sh ] \
		; then
			if cp -v /usr/share/docker.io/contrib/nuke-graph-directory.sh /var/lib/docker/; then
				chmod +x /var/lib/docker/nuke-graph-directory.sh || :
			fi
		fi
		;;

	*)
		;;
esac



# because we had to use "dh_installinit --no-start", we get to make sure the daemon is stopped on uninstall
# (this is adapted from debhelper's "autoscripts/prerm-init-norestart")
if [ "$1" = remove ]; then
	invoke-rc.d docker stop
fi
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.templates
Template: docker.io/restart
Type: boolean
Default: false
Description: Automatically restart Docker daemon?
 If Docker is upgraded without restarting the Docker daemon, Docker will often
 have trouble starting new containers, and in some cases even maintaining the
 containers it is currently running. See https://launchpad.net/bugs/1658691 for
 an example of this breakage.
 .
 Normally, upgrading the package would simply restart the associated daemon(s).
 In the case of the Docker daemon, that would also imply stopping all running
 containers (which will only be restarted if they're part of a "service", have
 an appropriate restart policy configured, or have some other means of being
 restarted such as an external systemd unit).
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.postrm
#!/bin/sh
set -e

# Automatically added by dh_installsystemd/13.14.1ubuntu5
if [ "$1" = remove ] && [ -d /run/systemd/system ] ; then
	systemctl --system daemon-reload >/dev/null || true
fi
# End automatically added section
# Automatically added by dh_installsystemd/13.14.1ubuntu5
if [ "$1" = "purge" ]; then
	if [ -x "/usr/bin/deb-systemd-helper" ]; then
		deb-systemd-helper purge 'docker.socket' >/dev/null || true
	fi
fi
# End automatically added section
# Automatically added by dh_installsystemd/13.14.1ubuntu5
if [ "$1" = remove ] && [ -d /run/systemd/system ] ; then
	systemctl --system daemon-reload >/dev/null || true
fi
# End automatically added section
# Automatically added by dh_installsystemd/13.14.1ubuntu5
if [ "$1" = "purge" ]; then
	if [ -x "/usr/bin/deb-systemd-helper" ]; then
		deb-systemd-helper purge 'docker.service' >/dev/null || true
	fi
fi
# End automatically added section
# Automatically added by dh_installdebconf/13.14.1ubuntu5
if [ "$1" = purge ] && [ -e /usr/share/debconf/confmodule ]; then
	. /usr/share/debconf/confmodule
	db_purge
fi
# End automatically added section
# Automatically added by dh_apparmor/4.0.1really4.0.0-beta3-0ubuntu0.1
if [ "$1" = "purge" ] && ! [ -e "/etc/apparmor.d/docker.io" ] ; then
    rm -f "/etc/apparmor.d/disable/docker.io" || true
    rm -f "/etc/apparmor.d/force-complain/docker.io" || true
    rm -f "/etc/apparmor.d/local/docker.io" || true
    rm -f /var/cache/apparmor/*/"docker.io" || true
    rmdir /etc/apparmor.d/disable 2>/dev/null || true
    rmdir /etc/apparmor.d/local   2>/dev/null || true
    rmdir /etc/apparmor.d         2>/dev/null || true
fi
# End automatically added section


case "$1" in
	purge)
		# if we have our saved "nuke-graph-directory.sh", let's use it
		# see also docker.io.prerm
		if [ -x /var/lib/docker/nuke-graph-directory.sh ]; then
			/var/lib/docker/nuke-graph-directory.sh /var/lib/docker
		fi
		;;

	*)
		;;
esac
sre@k8s-controller-01:~$ sudo cat /var/lib/docker/nuke-graph-directory.sh
cat: /var/lib/docker/nuke-graph-directory.sh: No such file or directory
sre@k8s-controller-01:~$ sudo ls -l /var/lib/docker
total 44
drwx--x--x 4 root root 4096 Oct 22 21:57 buildkit
drwx--x--- 2 root root 4096 Oct 22 21:57 containers
-rw------- 1 root root   36 Oct 22 21:57 engine-id
drwx------ 3 root root 4096 Oct 22 21:57 image
drwxr-x--- 3 root root 4096 Oct 22 21:57 network
drwx--x--- 3 root root 4096 Oct 24 17:28 overlay2
drwx------ 4 root root 4096 Oct 22 21:57 plugins
drwx------ 2 root root 4096 Oct 24 17:28 runtimes
drwx------ 2 root root 4096 Oct 22 21:57 swarm
drwx------ 2 root root 4096 Oct 24 17:28 tmp
drwx-----x 2 root root 4096 Oct 24 17:28 volumes
sre@k8s-controller-01:~$ sudo find /etc/apparmor.d 
/etc/apparmor.d
/etc/apparmor.d/devhelp
/etc/apparmor.d/lxc-usernsexec
/etc/apparmor.d/lxc-attach
/etc/apparmor.d/sbuild-hold
/etc/apparmor.d/evolution
/etc/apparmor.d/obsidian
/etc/apparmor.d/notepadqq
/etc/apparmor.d/qmapshack
/etc/apparmor.d/signal-desktop
/etc/apparmor.d/trinity
/etc/apparmor.d/privacybrowser
/etc/apparmor.d/cam
/etc/apparmor.d/scide
/etc/apparmor.d/sbuild-update
/etc/apparmor.d/thunderbird
/etc/apparmor.d/usr.bin.man
/etc/apparmor.d/runc
/etc/apparmor.d/ch-run
/etc/apparmor.d/disable
/etc/apparmor.d/plasmashell
/etc/apparmor.d/ubuntu_pro_apt_news
/etc/apparmor.d/busybox
/etc/apparmor.d/abstractions
/etc/apparmor.d/abstractions/fcitx
/etc/apparmor.d/abstractions/ssl_keys
/etc/apparmor.d/abstractions/p11-kit
/etc/apparmor.d/abstractions/fonts
/etc/apparmor.d/abstractions/qt5-settings-write
/etc/apparmor.d/abstractions/wayland
/etc/apparmor.d/abstractions/audio
/etc/apparmor.d/abstractions/mozc
/etc/apparmor.d/abstractions/smbpass
/etc/apparmor.d/abstractions/groff
/etc/apparmor.d/abstractions/exo-open
/etc/apparmor.d/abstractions/kde
/etc/apparmor.d/abstractions/ruby
/etc/apparmor.d/abstractions/ssl_certs
/etc/apparmor.d/abstractions/gtk
/etc/apparmor.d/abstractions/ubuntu-console-email
/etc/apparmor.d/abstractions/xad
/etc/apparmor.d/abstractions/xdg-open
/etc/apparmor.d/abstractions/freedesktop.org
/etc/apparmor.d/abstractions/ubuntu-helpers
/etc/apparmor.d/abstractions/gnome
/etc/apparmor.d/abstractions/ubuntu-gnome-terminal
/etc/apparmor.d/abstractions/python
/etc/apparmor.d/abstractions/dovecot-common
/etc/apparmor.d/abstractions/php
/etc/apparmor.d/abstractions/nis
/etc/apparmor.d/abstractions/ubuntu-browsers
/etc/apparmor.d/abstractions/mdns
/etc/apparmor.d/abstractions/hosts_access
/etc/apparmor.d/abstractions/ubuntu-konsole
/etc/apparmor.d/abstractions/snap_browsers
/etc/apparmor.d/abstractions/base
/etc/apparmor.d/abstractions/mir
/etc/apparmor.d/abstractions/opencl-pocl
/etc/apparmor.d/abstractions/user-write
/etc/apparmor.d/abstractions/xdg-desktop
/etc/apparmor.d/abstractions/opencl-intel
/etc/apparmor.d/abstractions/ldapclient
/etc/apparmor.d/abstractions/ubuntu-email
/etc/apparmor.d/abstractions/orbit2
/etc/apparmor.d/abstractions/svn-repositories
/etc/apparmor.d/abstractions/ubuntu-console-browsers
/etc/apparmor.d/abstractions/mysql
/etc/apparmor.d/abstractions/dbus-session
/etc/apparmor.d/abstractions/dbus-strict
/etc/apparmor.d/abstractions/recent-documents-write
/etc/apparmor.d/abstractions/user-tmp
/etc/apparmor.d/abstractions/ubuntu-bittorrent-clients
/etc/apparmor.d/abstractions/ubuntu-feed-readers
/etc/apparmor.d/abstractions/ubuntu-unity7-base
/etc/apparmor.d/abstractions/dri-common
/etc/apparmor.d/abstractions/ubuntu-xterm
/etc/apparmor.d/abstractions/kde-icon-cache-write
/etc/apparmor.d/abstractions/dbus
/etc/apparmor.d/abstractions/kde-globals-write
/etc/apparmor.d/abstractions/kde-language-write
/etc/apparmor.d/abstractions/dbus-accessibility
/etc/apparmor.d/abstractions/opencl
/etc/apparmor.d/abstractions/X
/etc/apparmor.d/abstractions/qt5-compose-cache-write
/etc/apparmor.d/abstractions/samba
/etc/apparmor.d/abstractions/dbus-session-strict
/etc/apparmor.d/abstractions/user-manpages
/etc/apparmor.d/abstractions/web-data
/etc/apparmor.d/abstractions/libpam-systemd
/etc/apparmor.d/abstractions/nvidia
/etc/apparmor.d/abstractions/opencl-common
/etc/apparmor.d/abstractions/php-worker
/etc/apparmor.d/abstractions/aspell
/etc/apparmor.d/abstractions/private-files-strict
/etc/apparmor.d/abstractions/enchant
/etc/apparmor.d/abstractions/apache2-common
/etc/apparmor.d/abstractions/bash
/etc/apparmor.d/abstractions/gio-open
/etc/apparmor.d/abstractions/nss-systemd
/etc/apparmor.d/abstractions/perl
/etc/apparmor.d/abstractions/qt5
/etc/apparmor.d/abstractions/php5
/etc/apparmor.d/abstractions/gnupg
/etc/apparmor.d/abstractions/opencl-mesa
/etc/apparmor.d/abstractions/trash
/etc/apparmor.d/abstractions/video
/etc/apparmor.d/abstractions/vulkan
/etc/apparmor.d/abstractions/ubuntu-browsers.d
/etc/apparmor.d/abstractions/ubuntu-browsers.d/kde
/etc/apparmor.d/abstractions/ubuntu-browsers.d/multimedia
/etc/apparmor.d/abstractions/ubuntu-browsers.d/productivity
/etc/apparmor.d/abstractions/ubuntu-browsers.d/ubuntu-integration
/etc/apparmor.d/abstractions/ubuntu-browsers.d/text-editors
/etc/apparmor.d/abstractions/ubuntu-browsers.d/plugins-common
/etc/apparmor.d/abstractions/ubuntu-browsers.d/mailto
/etc/apparmor.d/abstractions/ubuntu-browsers.d/java
/etc/apparmor.d/abstractions/ubuntu-browsers.d/chromium-browser
/etc/apparmor.d/abstractions/ubuntu-browsers.d/ubuntu-integration-xul
/etc/apparmor.d/abstractions/ubuntu-browsers.d/user-files
/etc/apparmor.d/abstractions/transmission-common
/etc/apparmor.d/abstractions/opencl-nvidia
/etc/apparmor.d/abstractions/private-files
/etc/apparmor.d/abstractions/ubuntu-unity7-messaging
/etc/apparmor.d/abstractions/dbus-network-manager-strict
/etc/apparmor.d/abstractions/ubuntu-unity7-launcher
/etc/apparmor.d/abstractions/wutmp
/etc/apparmor.d/abstractions/nameservice
/etc/apparmor.d/abstractions/crypto
/etc/apparmor.d/abstractions/dri-enumerate
/etc/apparmor.d/abstractions/mesa
/etc/apparmor.d/abstractions/openssl
/etc/apparmor.d/abstractions/dconf
/etc/apparmor.d/abstractions/authentication
/etc/apparmor.d/abstractions/ubuntu-media-players
/etc/apparmor.d/abstractions/samba-rpcd
/etc/apparmor.d/abstractions/postfix-common
/etc/apparmor.d/abstractions/fcitx-strict
/etc/apparmor.d/abstractions/consoles
/etc/apparmor.d/abstractions/apparmor_api
/etc/apparmor.d/abstractions/apparmor_api/find_mountpoint
/etc/apparmor.d/abstractions/apparmor_api/is_enabled
/etc/apparmor.d/abstractions/apparmor_api/examine
/etc/apparmor.d/abstractions/apparmor_api/change_profile
/etc/apparmor.d/abstractions/apparmor_api/introspect
/etc/apparmor.d/abstractions/gvfs-open
/etc/apparmor.d/abstractions/kerberosclient
/etc/apparmor.d/abstractions/winbind
/etc/apparmor.d/abstractions/likewise
/etc/apparmor.d/abstractions/user-mail
/etc/apparmor.d/abstractions/ibus
/etc/apparmor.d/abstractions/cups-client
/etc/apparmor.d/abstractions/dbus-accessibility-strict
/etc/apparmor.d/abstractions/kde-open5
/etc/apparmor.d/abstractions/user-download
/etc/apparmor.d/virtiofsd
/etc/apparmor.d/unix-chkpwd
/etc/apparmor.d/wpcom
/etc/apparmor.d/sbuild-upgrade
/etc/apparmor.d/sbuild-checkpackages
/etc/apparmor.d/vivaldi-bin
/etc/apparmor.d/vpnns
/etc/apparmor.d/foliate
/etc/apparmor.d/geary
/etc/apparmor.d/sbuild-destroychroot
/etc/apparmor.d/transmission
/etc/apparmor.d/ipa_verify
/etc/apparmor.d/mmdebstrap
/etc/apparmor.d/QtWebEngineProcess
/etc/apparmor.d/slirp4netns
/etc/apparmor.d/lxc-execute
/etc/apparmor.d/msedge
/etc/apparmor.d/lxc-create
/etc/apparmor.d/rpm
/etc/apparmor.d/tup
/etc/apparmor.d/crun
/etc/apparmor.d/nvidia_modprobe
/etc/apparmor.d/pageedit
/etc/apparmor.d/nautilus
/etc/apparmor.d/tuxedo-control-center
/etc/apparmor.d/epiphany
/etc/apparmor.d/sbuild-distupgrade
/etc/apparmor.d/lxc-stop
/etc/apparmor.d/qcam
/etc/apparmor.d/wike
/etc/apparmor.d/sbuild
/etc/apparmor.d/keybase
/etc/apparmor.d/linux-sandbox
/etc/apparmor.d/podman
/etc/apparmor.d/Discord
/etc/apparmor.d/local
/etc/apparmor.d/local/usr.bin.man
/etc/apparmor.d/local/ubuntu_pro_apt_news
/etc/apparmor.d/local/nvidia_modprobe
/etc/apparmor.d/local/lsb_release
/etc/apparmor.d/local/usr.bin.tcpdump
/etc/apparmor.d/local/usr.sbin.rsyslogd
/etc/apparmor.d/local/ubuntu_pro_esm_cache
/etc/apparmor.d/local/README
/etc/apparmor.d/local/usr.lib.snapd.snap-confine.real
/etc/apparmor.d/libcamerify
/etc/apparmor.d/element-desktop
/etc/apparmor.d/lsb_release
/etc/apparmor.d/code
/etc/apparmor.d/lxc-destroy
/etc/apparmor.d/kchmviewer
/etc/apparmor.d/abi
/etc/apparmor.d/abi/3.0
/etc/apparmor.d/abi/kernel-5.4-outoftree-network
/etc/apparmor.d/abi/kernel-5.4-vanilla
/etc/apparmor.d/abi/4.0
/etc/apparmor.d/github-desktop
/etc/apparmor.d/sbuild-clean
/etc/apparmor.d/sbuild-apt
/etc/apparmor.d/tunables
/etc/apparmor.d/tunables/multiarch
/etc/apparmor.d/tunables/home
/etc/apparmor.d/tunables/share
/etc/apparmor.d/tunables/sys
/etc/apparmor.d/tunables/apparmorfs
/etc/apparmor.d/tunables/xdg-user-dirs
/etc/apparmor.d/tunables/etc
/etc/apparmor.d/tunables/home.d
/etc/apparmor.d/tunables/home.d/ubuntu
/etc/apparmor.d/tunables/home.d/site.local
/etc/apparmor.d/tunables/dovecot
/etc/apparmor.d/tunables/global
/etc/apparmor.d/tunables/securityfs
/etc/apparmor.d/tunables/alias
/etc/apparmor.d/tunables/kernelvars
/etc/apparmor.d/tunables/multiarch.d
/etc/apparmor.d/tunables/multiarch.d/site.local
/etc/apparmor.d/tunables/proc
/etc/apparmor.d/tunables/run
/etc/apparmor.d/tunables/xdg-user-dirs.d
/etc/apparmor.d/tunables/xdg-user-dirs.d/site.local
/etc/apparmor.d/userbindmount
/etc/apparmor.d/flatpak
/etc/apparmor.d/firefox
/etc/apparmor.d/usr.bin.tcpdump
/etc/apparmor.d/lxc-unshare
/etc/apparmor.d/lc-compliance
/etc/apparmor.d/vdens
/etc/apparmor.d/qutebrowser
/etc/apparmor.d/opam
/etc/apparmor.d/usr.sbin.rsyslogd
/etc/apparmor.d/ubuntu_pro_esm_cache
/etc/apparmor.d/steam
/etc/apparmor.d/sbuild-shell
/etc/apparmor.d/MongoDB_Compass
/etc/apparmor.d/slack
/etc/apparmor.d/loupe
/etc/apparmor.d/goldendict
/etc/apparmor.d/rssguard
/etc/apparmor.d/unprivileged_userns
/etc/apparmor.d/rsyslog.d
/etc/apparmor.d/rsyslog.d/README
/etc/apparmor.d/sbuild-createchroot
/etc/apparmor.d/1password
/etc/apparmor.d/uwsgi-core
/etc/apparmor.d/buildah
/etc/apparmor.d/sbuild-abort
/etc/apparmor.d/sbuild-adduser
/etc/apparmor.d/chrome
/etc/apparmor.d/stress-ng
/etc/apparmor.d/systemd-coredump
/etc/apparmor.d/rootlesskit
/etc/apparmor.d/sbuild-unhold
/etc/apparmor.d/force-complain
/etc/apparmor.d/ch-checkns
/etc/apparmor.d/opera
/etc/apparmor.d/toybox
/etc/apparmor.d/polypane
/etc/apparmor.d/balena-etcher
/etc/apparmor.d/surfshark
/etc/apparmor.d/usr.lib.snapd.snap-confine.real
/etc/apparmor.d/brave
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.postinst
#!/bin/sh
set -e

. /usr/share/debconf/confmodule

case "$1" in
	configure)
		if [ -z "$2" ]; then
			# make sure the "docker" system group exists for "docker.socket" to apply it as the group on "docker.sock"
			if ! getent group docker > /dev/null 2>&1; then
				addgroup --system docker
			fi
		fi

		# ZFS handling: create a dedicated ZFS docker dataset to handle all children containers in a single,
		# persistent, place.
		# Also check if zfs executable exists and if it is in $PATH.
		# The zfs command is provided by zfs-fuse | zfsutils and they
		# are runtime Suggested dependencies which means they are not
		# necessarily available during configuration time (LP: #1910133).
		if [ -x "$(command -v zfs)" ] && modinfo zfs >/dev/null 2>&1; then
			# if there is no mountpoint /var/lib/docker:
			# 1: create <currentpool>/var/lib/docker if doesn’t exist (zfs mount?)
			# /var/lib with canmount off if doesn’t exist
			# /var with canmount off if doesn’t exist
			rpool="$(zfs mount | awk '$2=="/" {print $1}'|  cut -d/ -f1)"

			if [ -n "$rpool" ]; then
				dockermnt="$(findmnt -n -o SOURCE /var/lib/docker || true)"

				# Create <currentpool>/var/lib/docker if doesn’t exist
				if echo "$dockermnt" | grep -qE '^$|/ROOT/'; then
					zfs create -o canmount=off "$rpool"/var 2>/dev/null || true
					zfs create -o canmount=off "$rpool"/var/lib 2>/dev/null || true
					if dpkg --compare-versions "$2" le-nl '19.03.8-0ubuntu2'; then
						invoke-rc.d docker stop || true
						mv /var/lib/docker /var/lib/docker.migrating
					fi
					zfs create "$rpool"/var/lib/docker 2>/dev/null || true
					dockermnt="$rpool"/var/lib/docker
				fi

				if dpkg --compare-versions "$2" le-nl '19.03.8-0ubuntu2'; then
					mv /var/lib/docker.migrating/* /var/lib/docker/
					rmdir /var/lib/docker.migrating/
					# Migrate datasets
					for dataset in $(zfs list -H -t filesystem -o name,mountpoint,canmount -r "$rpool"/ROOT | grep -E "/var/lib/[0-9a-f]{64}(-init)?\slegacy\son" | cut -f1); do
						dockerid=${dataset##*/}
						zfs rename "$dataset" "$dockermnt/$dockerid" || true
					done
					# Purge their zsys history datasets
					for dataset in $(zfs list -H -t snapshot -o name -r "$rpool"/var/lib/docker | grep "@autozsys_"); do
						zfs destroy -R "$dataset" || true
					done
					invoke-rc.d docker start || true
				fi
			fi
		fi

		;;
	abort-*)
		# How'd we get here??
		exit 1
		;;
	*)
		;;
esac

# Restart Docker if it's running (thus this is an upgrade) and the user (via
# debconf) tells us they're OK with that.
#
# The snippet below is supposed to be in a config maintscript but it is not
# because of the following:
#
## When a package is installed in the system, dpkg-preconfigure (*not*
## dpkg-reconfigure) is invoked.  If the package has debconf templates *and* a
## .config file, then dpkg-preconfigure executes the .config script which
## ultimately asks the debconf questions to the user.  Then, later in the
## installation process, when the postinst script is executed, the config script
## is once again invoked.  You might think "wait, won't that mean that the user
## will get asked the same question(s) twice?!", and you would be right!  That's
## one of the reasons why debconf keeps track of whether the questions have been
## asked already (the "seen" flag in the database).
##
## docker.io manipulates this "seen" flag (see the "db_fset" call below) in
## order to make sure that the user will always get asked the restart question
## during package upgrades.  If we leave this code inside the postinst script
## and get rid of the config script, then the question only gets asked once
## because dpkg-preconfigure won't find a config script and won't invoke
## debconf.  But if you move this code into a proper config script, the question
## gets asked twice during upgrades/reinstalls.
db_version 2.0
db_fset docker.io/restart seen false
if [ -n "$2" ] && [ "$1" = 'configure' ] && {
        # either:
        #   - we're doing "dpkg-reconfigure" (and thus need to "db_input" to make sure users can change their answer between installs/upgrades)
        #   - we're doing install/upgrade and Docker is running (and thus it matters whether or not the user wants us to restart Docker for them)
        [ -n "${DEBCONF_RECONFIGURE:-}" ] \
        || invoke-rc.d --disclose-deny docker status > /dev/null 2>&1
}; then
        db_input high docker.io/restart || :
        db_go || :
        if [ -z "${DEBCONF_RECONFIGURE:-}" ]; then
                # only perform the actual restart if we're doing install/upgrade (not during interactive "dpkg-reconfigure")
                db_get docker.io/restart
                if [ "$RET" = 'true' ]; then
                        # Docker daemon appears to be running and should be restarted
                        invoke-rc.d docker restart || :
                fi
        fi
fi
db_stop

# Automatically added by dh_apparmor/4.0.1really4.0.0-beta3-0ubuntu0.1
if [ "$1" = "configure" ]; then
    APP_PROFILE="/etc/apparmor.d/docker.io"
    if [ -f "$APP_PROFILE" ]; then
        # Add the local/ include
        LOCAL_APP_PROFILE="/etc/apparmor.d/local/docker.io"

        test -e "$LOCAL_APP_PROFILE" || {
            mkdir -p `dirname "$LOCAL_APP_PROFILE"`
            install --mode 644 /dev/null "$LOCAL_APP_PROFILE"
        }

        # Reload the profile, including any abstraction updates
        if aa-enabled --quiet 2>/dev/null; then
            apparmor_parser -r -T -W "$APP_PROFILE" || true
        fi
    fi
fi
# End automatically added section
# Automatically added by dh_installsystemd/13.14.1ubuntu5
if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ] ; then
	# The following line should be removed in trixie or trixie+1
	deb-systemd-helper unmask 'docker.service' >/dev/null || true

	# was-enabled defaults to true, so new installations run enable.
	if deb-systemd-helper --quiet was-enabled 'docker.service'; then
		# Enables the unit on first installation, creates new
		# symlinks on upgrades if the unit file has changed.
		deb-systemd-helper enable 'docker.service' >/dev/null || true
	else
		# Update the statefile to add new symlinks (if any), which need to be
		# cleaned up on purge. Also remove old symlinks.
		deb-systemd-helper update-state 'docker.service' >/dev/null || true
	fi
fi
# End automatically added section
# Automatically added by dh_installsystemd/13.14.1ubuntu5
if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ] ; then
	# The following line should be removed in trixie or trixie+1
	deb-systemd-helper unmask 'docker.socket' >/dev/null || true

	# was-enabled defaults to true, so new installations run enable.
	if deb-systemd-helper --quiet was-enabled 'docker.socket'; then
		# Enables the unit on first installation, creates new
		# symlinks on upgrades if the unit file has changed.
		deb-systemd-helper enable 'docker.socket' >/dev/null || true
	else
		# Update the statefile to add new symlinks (if any), which need to be
		# cleaned up on purge. Also remove old symlinks.
		deb-systemd-helper update-state 'docker.socket' >/dev/null || true
	fi
fi
# End automatically added section


# because we had to use "dh_installinit --no-start", we get to make sure the daemon is started on first install (and upgrades thereafter, if it isn't running)
# (this is adapted from debhelper's "autoscripts/postinst-init")
if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ]; then
	if [ -z "${DEBCONF_RECONFIGURE:-}" ] && ! invoke-rc.d docker status > /dev/null 2>&1 ; then
		invoke-rc.d docker start || :
	fi
fi
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/docker.io.md5sums
0baf664f0cdf9ad8e3512219f7c57e95  usr/bin/docker
42efff0cc371f9ade30dc06eac0ed56c  usr/bin/docker-init
5c777bcbd2e4edfecc1a0439d3d283fb  usr/bin/docker-proxy
d3a25bcfef7d0b2e489aa8f91e407020  usr/bin/dockerd
e530999aec449df5180aabf88dea9e13  usr/lib/systemd/system/docker.service
eef7a0f58266beac317305cc3ef1a2e1  usr/lib/systemd/system/docker.socket
bb319f5d0205f1a55cd30e30d98bf5c8  usr/share/bash-completion/completions/docker
a12f6b8d45233e37cfee781736adf118  usr/share/doc/docker.io/NOTICE
a2b1bf05ee13d772e15dcb5acde8cc09  usr/share/doc/docker.io/README.Debian
702f4087d132eea6c603175e121bc3b2  usr/share/doc/docker.io/README.md
fd76f33b1c9b5305b71426dff0dd08c6  usr/share/doc/docker.io/changelog.Debian.gz
83ab3283a1de7611b85dae2f3fd9ea0f  usr/share/doc/docker.io/copyright
b963838cc73c7271bc7550a0612cfd47  usr/share/docker.io/contrib/check-config.sh
1e9a0968a3116fb467ce1a36d8477f33  usr/share/docker.io/contrib/nuke-graph-directory.sh
a4712e9cf967debe05a2d6864ca4b4a5  usr/share/lintian/overrides/docker.io
80afb0e236710261495ac4604d5563f9  usr/share/man/man1/docker-attach.1.gz
fd2f1d821aa65e53f6f3a49bcf033f64  usr/share/man/man1/docker-build.1.gz
8ea1487905294f2aa8cc23d1897061d7  usr/share/man/man1/docker-builder-build.1.gz
c32eeb01c821152b82ce8440e03ed343  usr/share/man/man1/docker-builder-prune.1.gz
8142aac57a40d39bd7bdf5c058225228  usr/share/man/man1/docker-builder.1.gz
c6372e497c88c9d5727ddba4d279bee7  usr/share/man/man1/docker-checkpoint-create.1.gz
a91262dbbfd8f49305814386c6063fde  usr/share/man/man1/docker-checkpoint-ls.1.gz
eec6ea2e962bf78082cdc744bc5bdfd5  usr/share/man/man1/docker-checkpoint-rm.1.gz
ca3651062b3af7f2fb33192e072af906  usr/share/man/man1/docker-checkpoint.1.gz
8b397a1f5f52486644cc37327b00d793  usr/share/man/man1/docker-commit.1.gz
970c51fea50e349038a9df418d1e77e6  usr/share/man/man1/docker-config-create.1.gz
63f3c88eff2fba104b683e3cef896714  usr/share/man/man1/docker-config-inspect.1.gz
4bb31c99b5b2080d483e139e60b4f1e4  usr/share/man/man1/docker-config-ls.1.gz
9947e5c7f1f6ce509b1b24d95dd4c00a  usr/share/man/man1/docker-config-rm.1.gz
dcc61d2ccfd0e1726650748cb4b1f403  usr/share/man/man1/docker-config.1.gz
1df25bedc9bb91192aa2eaf3cf114ba7  usr/share/man/man1/docker-container-attach.1.gz
d221d844c3d19fb0a2e275ffd84722b6  usr/share/man/man1/docker-container-commit.1.gz
6bfbe9d7352dfc31a056ad0dea2dceaa  usr/share/man/man1/docker-container-cp.1.gz
e7a684944d1c96a62d39f36e4f824824  usr/share/man/man1/docker-container-create.1.gz
6fd38762891912c815fc492a3f124912  usr/share/man/man1/docker-container-diff.1.gz
1506f1ed1109c913845a05aef91da318  usr/share/man/man1/docker-container-exec.1.gz
eb6bf2a7e3b99a8093fd17b8b5cdebbc  usr/share/man/man1/docker-container-export.1.gz
788f0f274d6deabd303e414f7ed3228d  usr/share/man/man1/docker-container-inspect.1.gz
77df4ae961cdfbd23b6e8bfc1a77d962  usr/share/man/man1/docker-container-kill.1.gz
fe6d658635ff8489881a884f474a5dfd  usr/share/man/man1/docker-container-logs.1.gz
58a9acd7a64a785f3870f528e2cd9351  usr/share/man/man1/docker-container-ls.1.gz
21165c4e99247eaf55faf6b146e2d1af  usr/share/man/man1/docker-container-pause.1.gz
7badf59a7a14e2bc95805e008778295b  usr/share/man/man1/docker-container-port.1.gz
c11c85d3de34c411808893e2a6e29774  usr/share/man/man1/docker-container-prune.1.gz
409a9ad4d98428763bf145d00c56bbe5  usr/share/man/man1/docker-container-rename.1.gz
df52e6d5ce363428478ad5051a54bbf9  usr/share/man/man1/docker-container-restart.1.gz
f4182d4510c50d649a08db8ec78aff04  usr/share/man/man1/docker-container-rm.1.gz
0cab7c133ae24cc65314613a2ee6beca  usr/share/man/man1/docker-container-run.1.gz
4319c6363e61d35510b1a487283f604f  usr/share/man/man1/docker-container-start.1.gz
68bffdc45b0be75d3372be9af4ad1ae1  usr/share/man/man1/docker-container-stats.1.gz
d69ad50890f1d73e70d073e22a4a5876  usr/share/man/man1/docker-container-stop.1.gz
0918ea5811040d94a3f02bfb8077aa4d  usr/share/man/man1/docker-container-top.1.gz
4b2bac9d5c0e2e45419c99599a9ece00  usr/share/man/man1/docker-container-unpause.1.gz
e21aa53b4641128f94e978a6bdb46285  usr/share/man/man1/docker-container-update.1.gz
81d73c2b09fb3a043c3575bb6c1da55c  usr/share/man/man1/docker-container-wait.1.gz
74b98802d978a2bb8e239117f17e7381  usr/share/man/man1/docker-container.1.gz
aa640fb44cf54d945ab937e1408e73bc  usr/share/man/man1/docker-context-create.1.gz
c17551d5d3ec14b82b4b5060b06b95a3  usr/share/man/man1/docker-context-export.1.gz
91b266f34bb23d930ddc41c1d1142778  usr/share/man/man1/docker-context-import.1.gz
4d2c78a353e4faa386d8f83aaf195339  usr/share/man/man1/docker-context-inspect.1.gz
cc5203ea80e25582174f8ff17ee1635d  usr/share/man/man1/docker-context-ls.1.gz
298dc5479e844289e0c224f3c275f92b  usr/share/man/man1/docker-context-rm.1.gz
09a98b95dbb3cd3008044c9857a5dc92  usr/share/man/man1/docker-context-show.1.gz
9ba9969ad8fc65894a82daa70ea629e0  usr/share/man/man1/docker-context-update.1.gz
00ec62d758675a7d1258110a91e884ed  usr/share/man/man1/docker-context-use.1.gz
6c22c2a9d5f2eafd4a0ae7bedd554e5b  usr/share/man/man1/docker-context.1.gz
34c6c64940a4d4dd9eeefd6ad4296f10  usr/share/man/man1/docker-cp.1.gz
23e2695c602b1f162f2b9b438e248387  usr/share/man/man1/docker-create.1.gz
8017c9370d57ff6dae0f5e6e66ed78ed  usr/share/man/man1/docker-diff.1.gz
6ff8b72f8b1f6aa172176dd68db89edb  usr/share/man/man1/docker-events.1.gz
f909577ffdc0e7c16734f4f378f1f2bf  usr/share/man/man1/docker-exec.1.gz
0b34863cbe52a1d65e196232471a1b01  usr/share/man/man1/docker-export.1.gz
458500a413aa776e0db0ba733ad1cf91  usr/share/man/man1/docker-history.1.gz
c73789a1b2b6d1ecf400a917fda7b09d  usr/share/man/man1/docker-image-build.1.gz
275e81a20dbc6b63246f85690532bd26  usr/share/man/man1/docker-image-history.1.gz
a52b244bb9278dbcba92d5ad66e29e2d  usr/share/man/man1/docker-image-import.1.gz
1fc622e2a4adac4601cab5391eb95b51  usr/share/man/man1/docker-image-inspect.1.gz
7aa1db75310636a56ca2bcdc8ce6db49  usr/share/man/man1/docker-image-load.1.gz
3eed4906881418c2f09257cf4103944c  usr/share/man/man1/docker-image-ls.1.gz
fdcf032ba3f0491849804ea9904c1d12  usr/share/man/man1/docker-image-prune.1.gz
d8e7dcc5dd81d076f226ae2707df0d4a  usr/share/man/man1/docker-image-pull.1.gz
348e0cfcc55163eaf576db3cf6071e1f  usr/share/man/man1/docker-image-push.1.gz
d0f4a408c840c4f4073b31521e6abbec  usr/share/man/man1/docker-image-rm.1.gz
e19edb20271102170e631593c5d66a4e  usr/share/man/man1/docker-image-save.1.gz
e46c2ac4560d652c25d1b1d245b86892  usr/share/man/man1/docker-image-tag.1.gz
ea15930335bad399ed8ae47549b042f9  usr/share/man/man1/docker-image.1.gz
bea388a100c34ac92a652708f09911f4  usr/share/man/man1/docker-images.1.gz
a716b6e23276c9a97aa66a8b2e0685e7  usr/share/man/man1/docker-import.1.gz
a07ecd8b5302031f0486144ed8d1022a  usr/share/man/man1/docker-info.1.gz
2994874700c1d5cfb526b6300451d539  usr/share/man/man1/docker-inspect.1.gz
8091f0428a8b9112cefb872306740ec4  usr/share/man/man1/docker-kill.1.gz
2bd5d8a7db6bfcc73f0c18d14610b0d6  usr/share/man/man1/docker-load.1.gz
147df214ca9fb2e6895e1ba1d870b5f0  usr/share/man/man1/docker-login.1.gz
952d191b6bc74e9b6d06b074015fa47a  usr/share/man/man1/docker-logout.1.gz
e9c98a09fe4cdf963bcac9693b164819  usr/share/man/man1/docker-logs.1.gz
7f58b9a6dfb8ce6a7721d932cdec8d89  usr/share/man/man1/docker-manifest-annotate.1.gz
4fd8e7c75cbf068f19293a7337609087  usr/share/man/man1/docker-manifest-create.1.gz
45b6bf595355c00f086af148aca698eb  usr/share/man/man1/docker-manifest-inspect.1.gz
556ab77d0409e88627bfa137b64f75f9  usr/share/man/man1/docker-manifest-push.1.gz
82ec10b290d6d29f23825197bc708d48  usr/share/man/man1/docker-manifest-rm.1.gz
5e57c8620733709274f4161da8e39abe  usr/share/man/man1/docker-manifest.1.gz
156e2a1ca0f96b8775d91642fe390be5  usr/share/man/man1/docker-network-connect.1.gz
2521d46d47dcb948eca87ea74be49612  usr/share/man/man1/docker-network-create.1.gz
91a9f29825fe7c147e8e8c594c5530ce  usr/share/man/man1/docker-network-disconnect.1.gz
60da8c32bbc5a52a8fca81730fb4232e  usr/share/man/man1/docker-network-inspect.1.gz
5c8055bdab208700e544ab816db425be  usr/share/man/man1/docker-network-ls.1.gz
0f46813197a7fa044a9a7b406bcedff1  usr/share/man/man1/docker-network-prune.1.gz
1d6b65d1ee7ff2a5b30b8e68e7f861b6  usr/share/man/man1/docker-network-rm.1.gz
29085ed9e6367a66e1d337acfab02ab1  usr/share/man/man1/docker-network.1.gz
bbb2cb0cde63a001da7a1fcd50f20c9d  usr/share/man/man1/docker-node-demote.1.gz
9f7d6ac9d524487fff3f771c91c0e3ad  usr/share/man/man1/docker-node-inspect.1.gz
0ae498c2b3170c7397cc684d8714c49d  usr/share/man/man1/docker-node-ls.1.gz
84d657c6643358defdd06a9530c2d907  usr/share/man/man1/docker-node-promote.1.gz
267bec4d5f19ed39251dbf63debcfff8  usr/share/man/man1/docker-node-ps.1.gz
f21c2f28182c0cc7722b977a26d922b6  usr/share/man/man1/docker-node-rm.1.gz
6cc5a642a61e5fdaba6f15f9d0053c5d  usr/share/man/man1/docker-node-update.1.gz
b8faa03a780e4daeaf32c8d9b6d052a3  usr/share/man/man1/docker-node.1.gz
e47aeb024848de78c2ce15f0c8bb2b68  usr/share/man/man1/docker-pause.1.gz
0c19e6e8f10eb68e376df7e9ea856caf  usr/share/man/man1/docker-plugin-create.1.gz
644f9531597fbbed3fea69b5a97b8052  usr/share/man/man1/docker-plugin-disable.1.gz
a1a281a574f8ba03549b86b75d8471d8  usr/share/man/man1/docker-plugin-enable.1.gz
3b9a9ca156d44c4baaf543ab03e0e7c8  usr/share/man/man1/docker-plugin-inspect.1.gz
7b05cc6063154fb92ce9d0cf4117eec0  usr/share/man/man1/docker-plugin-install.1.gz
a4138f2d2b1d7c7b46ac4ec131c4b837  usr/share/man/man1/docker-plugin-ls.1.gz
50ed11fa873c0075e9dd21e395af4ee7  usr/share/man/man1/docker-plugin-push.1.gz
984b0c87eb494e69318fb9d9fafbbcc7  usr/share/man/man1/docker-plugin-rm.1.gz
f4c69a499dc494f4d593bac700886825  usr/share/man/man1/docker-plugin-set.1.gz
65223f6516306e82fca736f0c720be91  usr/share/man/man1/docker-plugin-upgrade.1.gz
6b18d1b33f990c352fabf2c0d575419c  usr/share/man/man1/docker-plugin.1.gz
f72eb57dcd9c6304cef2c6827948339e  usr/share/man/man1/docker-port.1.gz
9dbc79d47837f9b51023f555cc5531c4  usr/share/man/man1/docker-ps.1.gz
7611dd205e30d37603dc44d338a86d83  usr/share/man/man1/docker-pull.1.gz
ec886dd299221472d821da9ecacfc30a  usr/share/man/man1/docker-push.1.gz
373313101221dedd5548b41aa40d97d9  usr/share/man/man1/docker-rename.1.gz
6901853c4436c9de3c7347580b537adb  usr/share/man/man1/docker-restart.1.gz
87b7258fe13cd1bb5077cdc3009a13b8  usr/share/man/man1/docker-rm.1.gz
d11b94786aca91f993c1689aba610c1f  usr/share/man/man1/docker-rmi.1.gz
11ac511ce5e3777ca01c21605e726c9d  usr/share/man/man1/docker-run.1.gz
3ef204395141573b965b644c6401e4b9  usr/share/man/man1/docker-save.1.gz
1e8509dde1f562c4108bdc8039dcd83f  usr/share/man/man1/docker-search.1.gz
274314b39088b8eddccd0c0d185d9044  usr/share/man/man1/docker-secret-create.1.gz
a9917033b068924193e33f03e400542e  usr/share/man/man1/docker-secret-inspect.1.gz
8b0339100038d27fe50d22e9fd9d82f6  usr/share/man/man1/docker-secret-ls.1.gz
10beaed23173a1917ea81f2fd9b16f0e  usr/share/man/man1/docker-secret-rm.1.gz
84d3f1bab9ed96cc88b5ff3146e38397  usr/share/man/man1/docker-secret.1.gz
27c67239d0a7051dd65deaf5a447e106  usr/share/man/man1/docker-service-create.1.gz
8aa34a2a0a6409e5db518616d0526dd7  usr/share/man/man1/docker-service-inspect.1.gz
2fa45b5fb0d18a92a7c8acd80ce4904a  usr/share/man/man1/docker-service-logs.1.gz
ed574b924efdcf398ecf5f7aac227bac  usr/share/man/man1/docker-service-ls.1.gz
f048960f4f6746703bb457534e725a28  usr/share/man/man1/docker-service-ps.1.gz
354e22416a554d890493d20d782d081c  usr/share/man/man1/docker-service-rm.1.gz
b7101b0b470ff8c1f500d120d5764baf  usr/share/man/man1/docker-service-rollback.1.gz
c9a2fc5f4e78905dea39b523a82cbf75  usr/share/man/man1/docker-service-scale.1.gz
22fd611d082077b405bbc89b97c4c1de  usr/share/man/man1/docker-service-update.1.gz
d67f7a03c525c90a58674ea59bd4e2d8  usr/share/man/man1/docker-service.1.gz
85aa4b945f2cbac45396fc0afb312129  usr/share/man/man1/docker-stack-config.1.gz
88b8ff87d35469f09645adee6a2960ee  usr/share/man/man1/docker-stack-deploy.1.gz
20d43f418dd4127377467053b939e5eb  usr/share/man/man1/docker-stack-ls.1.gz
81560ac79547c79b223b1f48f1570e3f  usr/share/man/man1/docker-stack-ps.1.gz
610ee1ce281a399b313f216e8703460d  usr/share/man/man1/docker-stack-rm.1.gz
d7f85e3f35c568833ea6d43006891ea0  usr/share/man/man1/docker-stack-services.1.gz
0360f4a177a5edc54471481554ab8607  usr/share/man/man1/docker-stack.1.gz
2fb5942526e2ba80ece0ae0bf9d9f54b  usr/share/man/man1/docker-start.1.gz
51abeca60a4e90987c0908d1759504e4  usr/share/man/man1/docker-stats.1.gz
55cecaa0eedf61288a3652295a76d80b  usr/share/man/man1/docker-stop.1.gz
aafd3f8a8a4d061a9867ca91cc611bc3  usr/share/man/man1/docker-swarm-ca.1.gz
ee9b8ffc0fd802ecb7820805a498f53c  usr/share/man/man1/docker-swarm-init.1.gz
2359a2b363ae732d7535d4be50e790cd  usr/share/man/man1/docker-swarm-join-token.1.gz
039c51c988066df59f348b0e2e6ab5d4  usr/share/man/man1/docker-swarm-join.1.gz
f8734d17029b60f5fd68408607c8d812  usr/share/man/man1/docker-swarm-leave.1.gz
4c81312d5ce36fd8d7f11b0a3b63ce69  usr/share/man/man1/docker-swarm-unlock-key.1.gz
1d444f4b49f86283d0823fce9c21e2b3  usr/share/man/man1/docker-swarm-unlock.1.gz
be1041c26c0b8647e700ad94582eb018  usr/share/man/man1/docker-swarm-update.1.gz
f0e81d5a5dfb82fede764e071a551ecd  usr/share/man/man1/docker-swarm.1.gz
822101c6df1c24dcbfc5bd231b8dde73  usr/share/man/man1/docker-system-df.1.gz
fa246b7874751384afd8cce81f79cd6c  usr/share/man/man1/docker-system-events.1.gz
4f3d14cc52bd212a669eb6a5efffa415  usr/share/man/man1/docker-system-info.1.gz
f203f8d61d6783667d4ff8f95bf53df0  usr/share/man/man1/docker-system-prune.1.gz
b68847af75c5ec52b2b197c49a93f9c7  usr/share/man/man1/docker-system.1.gz
c28e56be80e22bb24799fb020d2ed44f  usr/share/man/man1/docker-tag.1.gz
9d0ea1079226fb9f1c0d7437988430a2  usr/share/man/man1/docker-top.1.gz
e6937782407a7af7b7cd31ea66275508  usr/share/man/man1/docker-trust-inspect.1.gz
3cb2865344a684f46e540d0f1a761837  usr/share/man/man1/docker-trust-key-generate.1.gz
4a682a274245411d4e90f5d23b0b44e3  usr/share/man/man1/docker-trust-key-load.1.gz
4b0292568f0623d57070ad811634bfd0  usr/share/man/man1/docker-trust-key.1.gz
715a4a2dd55e035a557f4ff30dc35545  usr/share/man/man1/docker-trust-revoke.1.gz
dcf19a15edd59d8c5b8cc0fc4e46a03b  usr/share/man/man1/docker-trust-sign.1.gz
862b14602e1d10b79db7f0ba4c663ff1  usr/share/man/man1/docker-trust-signer-add.1.gz
9595990779e81e3cb39d9aa1949da303  usr/share/man/man1/docker-trust-signer-remove.1.gz
79202ea6b2d76aed74bafb967f6c3dd6  usr/share/man/man1/docker-trust-signer.1.gz
03121b0383d6dc0eed143abaa90be527  usr/share/man/man1/docker-trust.1.gz
a7b01d4e0e02b9405a9c38b56a3e5228  usr/share/man/man1/docker-unpause.1.gz
499c1a3493537b896dd5974940f251bd  usr/share/man/man1/docker-update.1.gz
3b2fb01ecbc1900a2c98d27a6375d058  usr/share/man/man1/docker-version.1.gz
27d3ff9d83da51dcae0c01d89b5f03f2  usr/share/man/man1/docker-volume-create.1.gz
ad5e92672879ea0d940d747b2bfcd299  usr/share/man/man1/docker-volume-inspect.1.gz
946a46be112bc73776b861ab7d1b9796  usr/share/man/man1/docker-volume-ls.1.gz
dd5a342ffc5e96ffe35db0ec7c22a0f7  usr/share/man/man1/docker-volume-prune.1.gz
7cc8704b6403cff78bade96bcd1b1a6d  usr/share/man/man1/docker-volume-rm.1.gz
291956a30ff647e86def902d0ab4a8ed  usr/share/man/man1/docker-volume-update.1.gz
59c24cea94771cbecb2bcf8c56eea10a  usr/share/man/man1/docker-volume.1.gz
87cf9d97303297596a294ca2dd91c6a6  usr/share/man/man1/docker-wait.1.gz
3f4af1ccc40e16d04ec193f7dee5a904  usr/share/man/man1/docker.1.gz
2bc50c81925d07bab50c2065ea15f5f2  usr/share/man/man5/Dockerfile.5.gz
25fd0c25e584fe79690e39f1c0f3bc96  usr/share/man/man5/docker-config-json.5.gz
46fe479ce87c44f52fe80d747bb8c8c7  usr/share/man/man8/dockerd.8.gz
75c18cf26112ca993959a94d218448a6  usr/share/zsh/vendor-completions/_docker
sre@k8s-controller-01:~$ 

