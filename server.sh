#!/bin/sh

cd server
pipenv run gunicorn autoapp:app
