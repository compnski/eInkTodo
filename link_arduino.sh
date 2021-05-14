#!/usr/bin/env bash
set -euo pipefail

mkdir -p  ~/Arduino/todo
test -L ~/Arduino/libraries/HttpClient || ln -s "`pwd`/HttpClient" ~/Arduino/libraries/
test -L ~/Arduino/libraries/TodoList || ln -s "`pwd`/TodoList" ~/Arduino/libraries/
test -L ~/Arduino/libraries/TodoDisplay || ln -s "`pwd`/TodoDisplay" ~/Arduino/libraries/
test -L ~/Arduino/todo/todo.ino || ln -s "`pwd`/todo.cpp" ~/Arduino/todo/todo.ino
test -L ~/Arduino/todo/secrets.h || ln -s "`pwd`/secrets.h" ~/Arduino/todo/
# test -L ~/Arduino/todo/trust_anchor.h || ln -s "`pwd`/trust_anchor.h" ~/Arduino/todo/
