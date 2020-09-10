#!/usr/bin/env bash

ps aux | awk '{ if ( == S ||  == D) { print  } }'
