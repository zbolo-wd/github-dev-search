Search devs in GitHub by location.

| Flags | Description               |
| ----- | ------------------------- |
| -l    | Location to search for.   |

# Requirements
## Install dart
### Install using apt-get
```bash
$ sudo apt-get update
$ sudo apt-get install apt-transport-https
$ sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
$ sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
$ sudo apt-get update
$ sudo apt-get install dart
```

# Compile and run
```bash
$ mkdir -p build
$ dart compile exe bin/github_dev_search.dart -o build/gds
$ build/gds
```
# Run without compile
```bash
$ dart run bin/github_dev_search.dart
```