#!/bin/bash

APP_IMAGE_NAME=takatori/test

# アプリケーションイメージをビルド
docker build -t=$APP_IMAGE_NAME .
