# Lite guide / 精简说明

These two Dockerfiles are the free subset.

这两份 Dockerfile 是免费子集。

- `python-slim.Dockerfile` builds in one stage and runs as user `app` in the next. `PY_IMAGE` defaults to `python:3.12-slim`. That tag is a starting point. Check upstream docs before you build.
- `generic-nonroot.Dockerfile` creates uid 10001 and runs `entrypoint.sh`. `BASE_IMAGE` defaults to `debian:bookworm-slim`. Check upstream docs before you change it. `groupadd` is a Debian tool.

- `python-slim.Dockerfile` 在一个阶段安装依赖，下一阶段以用户 `app` 运行。`PY_IMAGE` 默认是 `python:3.12-slim`。这只是起点。构建前请核对上游文档。
- `generic-nonroot.Dockerfile` 创建 uid 10001 并运行 `entrypoint.sh`。`BASE_IMAGE` 默认是 `debian:bookworm-slim`。改它之前请核对上游文档。`groupadd` 是 Debian 的工具。

Copy `python.dockerignore` or `generic.dockerignore` to the context root as `.dockerignore`. The context files are `examples/python-app` (`app.py`, `requirements.txt`) and `examples/generic-app/entrypoint.sh`.

把 `python.dockerignore` 或 `generic.dockerignore` 复制到上下文根目录，并命名为 `.dockerignore`。上下文文件是 `examples/python-app`（`app.py`、`requirements.txt`）和 `examples/generic-app/entrypoint.sh`。

Labels point at `example.com`. Replace them when the image is yours.

标签指向 `example.com`。镜像属于你自己之后再替换。
