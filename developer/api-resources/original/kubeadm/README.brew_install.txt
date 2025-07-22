
tim@Tims-MBP pods % kubeadm config images pull

zsh: command not found: kubeadm
tim@Tims-MBP pods % brew install kubeadm
==> Downloading https://formulae.brew.sh/api/formula.jws.json
###################################################################################################################################################################################################### 100.0%
==> Downloading https://formulae.brew.sh/api/cask.jws.json
###################################################################################################################################################################################################### 100.0%
Warning: No available formula with the name "kubeadm". Did you mean kubecm?
==> Searching for similarly named formulae and casks...
==> Formulae
kubecm

To install kubecm, run:
  brew install kubecm

==> Casks
kubenav

To install kubenav, run:
  brew install --cask kubenav

tim@Tims-MBP Desktop % ls /usr/local/Cellar/kubernetes-cli/1.31.1/bin
kubectl
tim@Tims-MBP Desktop % brew uninstall --cask kubenav
==> Uninstalling Cask kubenav
==> Backing App 'kubenav.app' up to '/usr/local/Caskroom/kubenav/4.2.3/kubenav.app'
==> Removing App '/Applications/kubenav.app'
==> Unlinking Binary '/usr/local/bin/kubenav'
==> Purging files for version 4.2.3 of Cask kubenav


tim@Tims-MBP kubeadm % brew install kubernetes-cli
==> Downloading https://formulae.brew.sh/api/formula.jws.json
############################################################################################################################ 100.0%
==> Downloading https://formulae.brew.sh/api/cask.jws.json
############################################################################################################################ 100.0%
kubernetes-cli 1.31.1 is already installed but outdated (so it will be upgraded).
==> Downloading https://ghcr.io/v2/homebrew/core/kubernetes-cli/manifests/1.31.2
############################################################################################################################ 100.0%
==> Fetching kubernetes-cli
==> Downloading https://ghcr.io/v2/homebrew/core/kubernetes-cli/blobs/sha256:9bb20c503fd7391fb50e6a007c9175806801f35cb0631e25391fa5
############################################################################################################################ 100.0%
==> Upgrading kubernetes-cli
  1.31.1 -> 1.31.2 
==> Pouring kubernetes-cli--1.31.2.ventura.bottle.tar.gz
==> Caveats
zsh completions have been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/kubernetes-cli/1.31.2: 237 files, 61.2MB
==> Running `brew cleanup kubernetes-cli`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /usr/local/Cellar/kubernetes-cli/1.31.1... (237 files, 61.2MB)
Removing: /Users/tim/Library/Caches/Homebrew/kubernetes-cli_bottle_manifest--1.31.1... (9.3KB)
==> `brew cleanup` has not been run in the last 30 days, running now...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Error: Permission denied @ apply2files - /usr/local/lib/docker/cli-plugins
tim@Tims-MBP kubeadm % ls -l /usr/local/Cellar/kubernetes-cli/1.31.2/bin
total 123480
-r-xr-xr-x  1 tim  admin  63221688 Oct 22 13:28 kubectl

