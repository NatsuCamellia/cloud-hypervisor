rootfs := env_var('HOME') / ".shrinkwrap/package/cca-3world/rootfs.ext2"
binary := "./build/cargo_target/aarch64-unknown-linux-musl/release/cloud-hypervisor"

default: build copy-img

# build cloud hypervisor
build:
	./scripts/dev_cli.sh build --release --libc musl --features arm_rme

# copy compiled cloud hypervisor binary to FVP rootfs image
copy-img:
	sudo mount {{rootfs}} mnt
	sudo cp {{binary}} mnt/root/
	sudo umount mnt

