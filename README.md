docker for mac
--
```
# check XQuartz > Configutaion > Security > Allow connections from network clients

# enable indirect GLX
defaults write org.xquartz.X11 enable_iglx -bool true

# restart XQuartz

docker run --add-host=host.docker.internal:host-gateway -e DISPLAY=host.docker.internal:0 -it -v ~/.Xauthority:/root/.Xauthority -v $PWD:/mnt --rm ghcr.io/philopon/autodock-tools:latest
```
