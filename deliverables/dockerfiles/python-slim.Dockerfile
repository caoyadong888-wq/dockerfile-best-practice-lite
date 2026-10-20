# syntax=docker/dockerfile:1
# Python slim multi-stage image. The app stage does not keep pip's download cache.
# Python slim 多阶段镜像。运行阶段不保留 pip 的下载缓存。
# PY_IMAGE is a starting point, not a promise that the tag still exists.
# PY_IMAGE 只是起点，不保证该标签仍然存在。
# Check upstream docs before you build: https://hub.docker.com/_/python
# 构建前请核对上游文档。

ARG PY_IMAGE=python:3.12-slim

FROM ${PY_IMAGE} AS builder
# python slim images are Debian-based and already include pip.
# If you point PY_IMAGE at a base without pip, check upstream docs.
# python slim 镜像基于 Debian，并且自带 pip。
# 如果 PY_IMAGE 指向没有 pip 的基础镜像，请核对上游文档。
ENV PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1
WORKDIR /build
COPY requirements.txt ./
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt \
    && mkdir -p /install
COPY app.py ./

FROM ${PY_IMAGE} AS runtime
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
# groupadd and useradd come from Debian's passwd package.
# Replace this RUN when PY_IMAGE is not Debian-based. Check upstream docs.
# groupadd 和 useradd 来自 Debian 的 passwd 包。
# PY_IMAGE 不是 Debian 时请换掉这一行，并核对上游文档。
RUN groupadd --gid 10001 app \
    && useradd --uid 10001 --gid 10001 --create-home --shell /usr/sbin/nologin app
WORKDIR /app
COPY --from=builder /install /usr/local
COPY --chown=app:app app.py /app/app.py
USER app
EXPOSE 8080
LABEL org.opencontainers.image.title="python-slim-example"
LABEL org.opencontainers.image.description="Stdlib HTTP app on a non-root multi-stage image"
LABEL org.opencontainers.image.url="https://example.com/python-slim"
LABEL org.opencontainers.image.source="https://example.com/python-slim"
LABEL org.opencontainers.image.vendor="example.com"
LABEL org.opencontainers.image.licenses="MIT"
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD ["python", "-c", "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8080/healthz', timeout=2).read()"]
CMD ["python", "/app/app.py"]
