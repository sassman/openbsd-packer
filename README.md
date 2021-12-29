# OpenBSD 7.0 packer template for parallels on macOS XI

> Needed only a parallels vagrant image with stock OpenBSD 7.0

## HowTo use the vagrant box (without building yourself)

```sh
vagrant init sassman/openbsd-7.0-amd64 --box-version 7.0.0
vagrant up
vagrant rsync-auto
```

## HowTo build it yourself

clone this repository 
```sh
git clone git@github.com:sassman/openbsd-packer.git
cd openbsd-packer
```

### Build the vagrant box

packer builds the box with: `make build`

### use the vagrant box

vagrant init and up: `make try`

## tested with

```sh
prlctl --version && vagrant --version && packer --version

prlctl version 17.1.1 (51537)
Vagrant 2.2.19
1.7.0
```

## published as

```sh
vagrant cloud publish \
  sassman/openbsd-7.0-amd64 7.0.0 \
  parallels openbsd-7.0-amd64-parallels.box \
  -d "OpenBSD 7.0 no ansible, no chef, just plain openBSD with ports installed" \
  --version-description "openBSD 7.0" \
  --release \
  --short-description "OpenBSD 7.0"
```

## what's in the box

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
- [openBSD/checksums](https://ftp.spline.de/pub/OpenBSD/7.0/amd64/SHA256)
- [inspiration](https://github.com/ryanmaclean/packer-openbsd)
- [inspiration-2](https://github.com/jugatsu/packer-mikrotik)
