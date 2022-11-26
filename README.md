# rosbot-mapping

Create a map of the unknow environment with ROSbot controlled over the Internet (with `DDS_CONFIG=HUSARNET_SIMPLE_AUTO` env) or in LAN network (with `DDS_CONFIG=DEFAULT` env).

## Quick Start

## PC

Connect a gamepad to USB port of your PC/laptop. 

Then create `.env` file 

```bash
cp .env.template .env
```

Check your configs

```
LIDAR_BAUDRATE=256000
LIDAR_SERIAL=/dev/ttyUSB0
DDS_CONFIG=DEFAULT
```

**Notes:**
- If you have RPLIDAR A3 or A2M12 (with violet border around the lenses) set: `LIDAR_BAUDRATE=256000`. Otherwise (for older A2 LIDARs): `LIDAR_BAUDRATE=115200`.
- Usually RPLIDAR is listed under `/dev/ttyUSB0`, but verify it with `ls -la /dev/ttyUSB*` command.
- With `DDS_CONFIG=DEFAULT` your robot and laptop need to be in the same LAN network. If you want to use this demo over the Internet, set `DDS_CONFIG=HUSARNET_SIMPLE_AUTO` and [enable Husarnet on ROSbot and you PC](https://husarion.com/manuals/rosbot/operating-system-reinstallation/)

Sync workspace with ROSbot

```bash
./sync_with_rosbot.sh rosbot2r
```

and run Rviz with a gamepad controller on your PC:

```bash
xhost +local:docker && \
docker compose -f compose.pc.yaml up
```

## ROSbot

> **Firmware version**
>
> Before running the project, make sure you have the correct version of a firmware flashed on your robot.
>
> Firmware flashing command (run in the ROSbot's terminal)
>
> ```
> docker stop rosbot microros || true && docker run \
> --rm -it --privileged \
> husarion/rosbot:humble-22-11-25 \
> /flash-firmware.py /root/firmware.bin
> ```

In the ROSbot's shell execute (in `/home/husarion/rosbot-mapping-vpn` directory)

```bash
docker compose -f compose.rosbot.yaml up
```