# LVM Setup

## Create PV
sudo pvcreate /dev/xvdb

## Create VG
sudo vgcreate appvg /dev/xvdb

## Create LV
sudo lvcreate -L 10G -n applv appvg

## Format LV
sudo mkfs.ext4 /dev/appvg/applv

## Mount
sudo mount /dev/appvg/applv /mnt/appdata
