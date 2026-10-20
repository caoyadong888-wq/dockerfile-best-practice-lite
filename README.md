# Dockerfile best-practice templates (lite)

Free subset. Two Dockerfiles: Python slim multi-stage, and a generic non-root runtime. English and Chinese comments. Base tags are `ARG` defaults.

## English

### Deliverables

- `deliverables/GUIDE.md` — how to copy the ignore file and what the `ARG` defaults mean
- `deliverables/dockerfiles/python-slim.Dockerfile`
- `deliverables/dockerfiles/generic-nonroot.Dockerfile`
- `deliverables/dockerignore/python.dockerignore`
- `deliverables/dockerignore/generic.dockerignore`
- `examples/python-app/app.py` — stdlib HTTP app on port 8080
- `examples/python-app/requirements.txt` — comments only, no third-party pins
- `examples/generic-app/entrypoint.sh`

```bash
# From the lite directory, after you confirm the base tags. Check upstream docs.
# This page does not run docker.
cp deliverables/dockerignore/python.dockerignore examples/python-app/.dockerignore
# docker build --file deliverables/dockerfiles/python-slim.Dockerfile --tag example.com/python-slim:demo examples/python-app
```

Labels use `example.com`. The full pack adds Node Alpine, static nginx, and Go-on-scratch Dockerfiles, their ignore files, filled-in contexts, a local checker, and a command printer that does not call the daemon.

Full version: GUMROAD_URL

## 中文

免费子集。两份 Dockerfile：Python slim 多阶段，以及通用非 root 运行时。注释是中英双语。基础标签写在 `ARG` 默认值里。

### 交付物

- `deliverables/GUIDE.md` — 如何复制忽略文件，以及 `ARG` 默认值是什么意思
- `deliverables/dockerfiles/python-slim.Dockerfile`
- `deliverables/dockerfiles/generic-nonroot.Dockerfile`
- `deliverables/dockerignore/python.dockerignore`
- `deliverables/dockerignore/generic.dockerignore`
- `examples/python-app/app.py` — 8080 端口上的标准库 HTTP 程序
- `examples/python-app/requirements.txt` — 只有注释，没有第三方版本钉
- `examples/generic-app/entrypoint.sh`

```bash
# 在精简目录中执行前，先确认基础标签。请核对上游文档。
# 这里的说明不会运行 docker。
cp deliverables/dockerignore/python.dockerignore examples/python-app/.dockerignore
# docker build --file deliverables/dockerfiles/python-slim.Dockerfile --tag example.com/python-slim:demo examples/python-app
```

标签使用 `example.com`。完整版另外有 Node Alpine、静态 nginx、scratch 上的 Go、对应的忽略文件、已填写的上下文、本地检查器，以及一个不会调用守护进程的命令打印脚本。

Full version: GUMROAD_URL
