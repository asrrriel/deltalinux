
cp configs/linux.config tmp/linux/.config

cd tmp/linux

make -j$(nproc) oldconfig

make -j$(nproc)

cd ../..

mkdir -p builds
mkdir -p builds/linux

cp tmp/linux/arch/x86/boot/bzImage builds/linux/vmlinuz