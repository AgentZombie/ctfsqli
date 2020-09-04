#!/bin/bash

/etc/init.d/mysql start

mysql < db.sql

su -m -c "/home/ctfsqli/ctfsqli" ctfsqli