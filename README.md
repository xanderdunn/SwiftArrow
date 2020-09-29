### Installation
- On Ubuntu 18.04, install Apache Arrow GLib:
    - `sudo apt update`
    - `sudo apt install -y -V ca-certificates lsb-release wget`
    - `wget https://apache.bintray.com/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb`
    - `sudo apt install -y -V ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb`
    - `sudo apt update`
    - `sudo apt install -y -V libarrow-glib-dev`
- Generate and build the Swift files:
    - `./build.sh`

### Dev Info
- The pkg-config file is at `/usr/lib/x86_64-linux-gnu/pkgconfig/arrow.pc`
