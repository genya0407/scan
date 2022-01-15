# scan

`scan` extracts desired pattern from stdin using regexp or delimiter.

```shell
$ cat regex.txt
hogehoge_nyan
hohho_nyan

# numbered capture
$ cat regex.txt | scan -p "(.+?)_(.+)" {1},{2}
hogehoge,nyan
hohho,nyan

# named capture
$ cat regex.txt | scan -p "(?<left>.+?)_(?<right>.+)" {left}:{right}
hogehoge:nyan
hohho:nyan

$ cat hoge.csv
aaa,bbb,ccc
xxx,yyy,zzz

# Using delimiter
$ cat hoge.csv | scan -d , {3}
ccc
zzz

$ cat hoge.tsv
aaa     bbb     ccc
xxx     yyy     zzz

# default delimiter is '\s+'
$ cat hoge.tsv | scan {2}
bbb
yyy
```

## Installation

```shell-session
$ gem install specific_install
$ gem specific_install -l https://github.com/genya0407/scan
$ scan --help
Usage: scan [options] OUTPUT_FORMAT
    -p [PATTERN]                     specify regexp
    -d [DELIMITER]                   specify delimiter
```
