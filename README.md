# OpenBSD 6.8 packer template for parallels on macOS XI

> Needed only a parallels vagrant image with stock OpenBSD 6.8

## build

clone this repository then and run inside:

```sh
packer build openbsd-6.8-amd64.json
```

## usage after building

```sh
vagrant box add openbsd-6.8 openbsd-6.8-amd64-parallels.box
vagrant init openbsd-6.8
vagrant up
vagrant rsync-auto
```

## tested with

```sh
prlctl --version && vagrant --version && packer --version

prlctl version 16.1.2 (49151)
Vagrant 2.2.14
1.6.6
```

## whats in the box

- ports are installed
- `doas` configuration for vagrant without password
- vagrant`s ssh key is authorized

## FAQ

- Q: I'm getting this error:

```plain
==> Some builds didn't complete successfully and had errors:
--> parallels-iso: Error creating VM: prlctl error: The command is available only in Parallels Desktop for Mac Pro or Business Edition.
```

- A: Sorry, you have to purchase the pro version of parallels, 50 Bucks a year ;-(

## References

- [docs/vagrant-parallels](https://parallels.github.io/vagrant-parallels/docs/configuration.html)
- [docs/vagrant-rsync](https://www.vagrantup.com/docs/synced-folders/rsync)
- [docs/packer-parallels](https://www.packer.io/docs/builders/parallels/iso)
- [openBSD/checksums](https://ftp.spline.de/pub/OpenBSD/6.8/amd64/SHA256)
- [inspiration](https://github.com/ryanmaclean/packer-openbsd)
- [inspiration-2](https://github.com/jugatsu/packer-mikrotik)
