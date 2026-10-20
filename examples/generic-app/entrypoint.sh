#!/bin/sh
# Generic non-root entrypoint. Replace the exec line with your process.
# 通用非 root 入口。把 exec 那一行换成你的进程。
# GNU sleep accepts "infinity". If BASE_IMAGE does not ship GNU sleep,
# change this line. Check upstream docs.
# GNU sleep 接受 infinity。如果 BASE_IMAGE 没有 GNU sleep，请改掉这一行并核对上游文档。
set -eu
echo "example.com generic-nonroot uid=$(id -u)"
exec sleep infinity
