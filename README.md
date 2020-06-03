# scan

`scan` extracts desired pattern from stdin using regexp or delimiter.

```shell
# by regexp
$ cat regex.txt
hogehoge_nyan
hohho_nyan

$ cat regex.txt | scan -p "(.+?)_(.+)" {1},{2}
hogehoge,nyan
hohho,nyan

# by delimiter
$ cat hoge.csv
aaa,bbb,ccc
xxx,yyy,zzz

$ cat hoge.csv | scan -d , {3}
ccc
zzz
```

## setup

Install `ruby` command.

Ruby version >= 2.6.3 (maybe more older versions)