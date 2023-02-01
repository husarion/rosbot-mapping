#!/bin/bash
set -e

# export RMW_IMPLEMENTATION_TEMP=$RMW_IMPLEMENTATION
# export FASTRTPS_DEFAULT_PROFILES_FILE_TEMP=$FASTRTPS_DEFAULT_PROFILES_FILE
# export CYCLONEDDS_URI_TEMP=$CYCLONEDDS_URI

# generate configs for FastDDS
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export FASTRTPS_DEFAULT_PROFILES_FILE=/fastdds.xml
husarnet-dds singleshot

# # generate configs for Cyclone
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# export CYCLONEDDS_URI=file:///cyclonedds.xml
# husarnet-dds singleshot

# # restore defaults:
# export RMW_IMPLEMENTATION=$RMW_IMPLEMENTATION_TEMP

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
test -f "/ros2_ws/install/setup.bash" && source "/ros2_ws/install/setup.bash"

exec "$@"
