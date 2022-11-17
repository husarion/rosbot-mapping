# rosbot-mapping

A GitHub template for ROSbot: creating a map using Slam Toolbox 

## Quick Start

Connect a gamepad to USB port of your PC/laptop. 

Then create `.env` file 

```bash
cp .env.template .env
```

and paste IP address of ROSbot there.

```
ROSBOT_IP=192.168.0.153
LIDAR_SERIAL=/dev/ttyUSB0
LIDAR_BAUDRATE=115200
```

## ROSbot

```bash
docker compose -f compose.rosbot.yaml up
```

## PC

Sync workspace with ROSbot

```bash
./sync_with_rosbot.sh $ROSBOT_IP
```

```bash
xhost +local:docker && \
docker compose -f compose.pc.yaml up
```


