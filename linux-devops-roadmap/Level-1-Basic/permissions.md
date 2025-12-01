# Linux File Permissions & Ownership

## Change Owner
sudo chown user:group file

## Change Permissions
chmod 755 file
chmod -R 770 /opt/project

## Permission bits:
r = read
w = write
x = execute

## Set SGID
sudo chmod g+s /opt/project

## Set Sticky Bit
sudo chmod +t /shared-folder
