VERSION:=7.0

build:
	packer build -var-file=vars/${VERSION}.json openbsd-amd64.json

try:
	vagrant box add --force openbsd-${VERSION} openbsd-${VERSION}-amd64-parallels.box
	vagrant init openbsd-${VERSION}
	vagrant up
	vagrant rsync-auto
	vagrant ssh

publish:
	vagrant cloud publish \
		sassman/openbsd-${VERSION}-amd64 ${VERSION}.0 \
		parallels openbsd-${VERSION}-amd64-parallels.box \
		-d "OpenBSD ${VERSION} no ansible, no chef, just plain openBSD with ports installed" \
		--version-description "openBSD ${VERSION}" \
		--release \
		--short-description "OpenBSD ${VERSION}"