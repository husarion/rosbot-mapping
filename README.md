# rosbot-mapping

A GitHub template for ROSbot: creating a map a using Slam Toolbox 

## Quick Start

Connect a gampad to USB port of your PC/laptop. 

Then create `.env` file (based on `.env.template`) and paste IP address of ROSbot there.

## PC

Sync workspace with ROSbot

```bash
./sync_with_rosbot.sh $ROSBOT_IP
```

```bash
docker compose -f compose.pc.yaml up
```

## ROSbot

```bash
docker compose -f compose.rosbot.yaml up
```
