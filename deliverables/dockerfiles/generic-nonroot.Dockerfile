# syntax=docker/dockerfile:1
# Generic non-root runtime. Swap BASE_IMAGE for the base you actually run.
# 通用非 root 运行时。把 BASE_IMAGE 换成你真正要跑的基础镜像。
# BASE_IMAGE is a starting point, not a promise that the tag still exists.
# BASE_IMAGE 只是起点，不保证该标签仍然存在。
# Check upstream docs before you build: https://hub.docker.com/_/debian
# 构建前请核对上游文档。

ARG BASE_IMAGE=debian:bookworm-slim

FROM ${BASE_IMAGE}
# groupadd and useradd are Debian passwd tools. On Alpine, use addgroup/adduser.
# Check upstream docs for the base you set in BASE_IMAGE.
# groupadd 和 useradd 是 Debian 的 passwd 工具。Alpine 上请改用 addgroup/adduser。
# 请按你设置的 BASE_IMAGE 核对上游文档。
RUN groupadd --gid 10001 app \
    && useradd --uid 10001 --gid 10001 --create-home --shell /usr/sbin/nologin app
WORKDIR /app
COPY --chown=app:app entrypoint.sh /app/entrypoint.sh
RUN chmod 0755 /app/entrypoint.sh
USER app
LABEL org.opencontainers.image.title="generic-nonroot-example"
LABEL org.opencontainers.image.description="Non-root user with an executable entrypoint"
LABEL org.opencontainers.image.url="https://example.com/generic-nonroot"
LABEL org.opencontainers.image.source="https://example.com/generic-nonroot"
LABEL org.opencontainers.image.vendor="example.com"
LABEL org.opencontainers.image.licenses="MIT"
ENTRYPOINT ["/app/entrypoint.sh"]
