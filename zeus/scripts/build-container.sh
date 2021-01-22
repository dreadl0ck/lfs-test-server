#!/bin/bash

echo "[INFO] creating lfs-test-server container..."

echo "[INFO] building & tagging container"
docker build -t dreadl0ck/lfs-test-server .
if (( $? != 0 )); then
	echo "[ERROR] failed to build container."
	exit 1
fi

echo "[INFO] pushing to registry"
docker push dreadl0ck/lfs-test-server
if (( $? != 0 )); then
	echo "[ERROR] failed to push container image. maybe you are not logged in?"
	exit 1
fi

echo "[INFO] done."