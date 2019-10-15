# Work Discipline: Data Structure II

This repository contains a college work of the data structure discipline made in Vala

## Dependencies

- vala
- meson
- ninja

## Build

```sh
meson build
cd build
ninja
```

## Add data

Copy `entrada.txt` and `bgg-13m-reviews.csv` to `build` folder. 
If they are in root folder you could create a symlink like in below.

```sh
ln -s ../entrada.txt entrada.txt
ln -s ../bgg-13m-reviews.csv bgg-13m-reviews.csv
```

## Run

```sh
./trabalho_ed2
```
