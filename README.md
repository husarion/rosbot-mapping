# rosbot-mapping

Create a map of the unknow environment with ROSbot controlled in the LAN network or [over the Internet](https://husarion.com/manuals/rosbot/remote-access/). 

## Quick Start

### PC

Clone this repository:

```
git clone https://github.com/husarion/rosbot-mapping.git
```

**Connect a gamepad to USB port of your PC/laptop** (the steering without the gamepad will also be described as an alternative).

Check your configs in `.env` file:

```
LIDAR_SERIAL=/dev/ttyUSB0

# for RPLIDAR A2M8:
# LIDAR_BAUDRATE=115200
# for RPLIDAR A2M12 and A3:
LIDAR_BAUDRATE=256000

DDS_CONFIG=DEFAULT
# DDS_CONFIG=HUSARNET_SIMPLE_AUTO

RMW_IMPLEMENTATION=rmw_fastrtps_cpp
# RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# to set rmw_cyclopnedds_cpp - on ROSbot run "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" in the terminal (system env has precedence over .env file)
```

**Notes:**
- Usually RPLIDAR is listed under `/dev/ttyUSB0`, but verify it with `ls -la /dev/ttyUSB*` command.
- If you have RPLIDAR A3 or A2M12 (with violet border around the lenses) set: `LIDAR_BAUDRATE=256000`. Otherwise (for older A2 LIDARs): `LIDAR_BAUDRATE=115200`.
- With `DDS_CONFIG=DEFAULT` your robot and laptop need to be in the same LAN network. If you want to use this demo over the Internet, set `DDS_CONFIG=HUSARNET_SIMPLE_AUTO` and [enable Husarnet on ROSbot and you PC](https://husarion.com/manuals/rosbot/remote-access/).

Sync workspace with ROSbot:

```bash
./sync_with_rosbot.sh <ROSbot_ip>
```

Open new terminal on PC and run Rviz depending on whether you [have](https://github.com/husarion/rosbot-mapping#with-the-gamepad-connected-to-pc) a gamepad or [not](https://github.com/husarion/rosbot-mapping#without-the-gamepad). Then you will be able to control the ROSbot and create map of the environment. The map os being saved automatically in the `rosbot-mapping/maps` folder.

#### With the gamepad connected to PC

```bash
xhost +local:docker && \
docker compose -f compose.pc.yaml up
```

#### Without the gamepad 

```bash
xhost +local:docker && \
docker compose -f compose.pc.yaml up -d map-saver rviz
```

Then enter the running `rviz` container:

```bash
docker exec -it rosbot-mapping-rviz-1 bash
```

Now, to teleoperate the ROSbot with your keyboard, execute:

```bash
ros2 run teleop_twist_keyboard teleop_twist_keyboard
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

In the ROSbot's terminal execute (in `/home/husarion/rosbot-mapping` directory):

```bash
docker compose -f compose.rosbot.yaml up
```