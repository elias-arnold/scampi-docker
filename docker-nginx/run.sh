#!/bin/bash

service nginx start
service mongodb start

/usr/bin/supervisord