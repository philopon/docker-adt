docker for mac
--
```
# check XQuartz > Configutaion > Security > Allow connections from network clients

# enable indirect GLX
defaults write org.xquartz.X11 enable_iglx -bool true

# restart XQuartz

/usr/X11/bin/xhost + 127.0.0.1

docker run --platform linux/amd64 --add-host=host.docker.internal:host-gateway -e DISPLAY=host.docker.internal:0 -it -v $PWD:/mnt --rm ghcr.io/philopon/autodock-tools:latest bash
```
