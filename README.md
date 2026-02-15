# Sysroot Support in Swift’s build-script

## Review
For review purposes on Github, it is as easy as opening the markdown on the website. The build process ensures the produced pdf looks/is formatted like the markdown on Github.

## Build Setup
- Install Pandoc
```
sudo apt install pandoc -y
```
- Install github like markdown engine, change download to your distro
```
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.jammy_amd64.deb
sudo dpkg -i wkhtmltox_0.12.6.1-3.jammy_amd64.deb
sudo apt install -y
```

## Build
```
./build.sh
```
produces proposal.pdf

