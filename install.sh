sudo apt update
sudo apt install -y gcc libelf-dev clang-11 llvm-11 lld-11 make flex bison
export PATH=$PATH:/usr/lib/llvm-11/bin
./rustup-init.sh -y
source $HOME/.cargo/env
rustup override set 1.57.0
rustup component add rust-src
cp config $HOME/.cargo/
cargo install --locked --version 0.56.0 bindgen

git config --global http.proxy "socks5://10.0.0.93:10808"
git clone https://github.com/Rust-for-Linux/linux.git --depth=1
cp .config linux
cd linux
make LLVM=1