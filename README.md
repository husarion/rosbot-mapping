# rosbot-mapping

A GitHub template for ROSbot: creating a map using Slam Toolbox 

## Quick Start

ROSbot and your laptop need to be in the same Husarnet network. Set ROSbot 2.0 Husarnet hostname to `rosbotabc` (it is used in DDS config files: `/dds/client.xml` and `/dds/server.xml`).

Connect a gamepad to USB port of your PC/laptop. 

Then create `.env` file 

```bash
cp .env.template .env
```

and check you LIDAR configs:

```
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
./sync_with_rosbot.sh rosbotabc
```

```bash
xhost +local:docker && \
docker compose -f compose.pc.yaml up
```


