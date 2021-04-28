#!/usr/bin/env bash
set -euo pipefail

mkdir -p  ~/Arduino/todo
ln -s "`pwd`/HttpClient" ~/Arduino/libraries/
ln -s "`pwd`/TodoList" ~/Arduino/libraries/
ln -s "`pwd`/todo.cpp" ~/Arduino/todo/todo.ino
ln -s "`pwd`/secrets.h" ~/Arduino/todo/todo.ino
ln -s "`pwd`/trust_anchor.h" ~/Arduino/todo/todo.ino
