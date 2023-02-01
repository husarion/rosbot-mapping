ARG IMAGE

FROM $IMAGE

ARG HUSARNET_DDS_RELEASE="v1.0.0"
ARG TARGETARCH=arm64

RUN apt update && apt install -y \
        curl

RUN curl -L https://github.com/husarnet/husarnet-dds/releases/download/${HUSARNET_DDS_RELEASE}/husarnet-dds-linux-${TARGETARCH} -o /usr/local/bin/husarnet-dds && \
    chmod +x /usr/local/bin/husarnet-dds

COPY ros_entrypoint.sh /