#!/usr/bin/env bash


echo "branch version=${1}"
pip install docker click pyinstaller
git clone -b $1 --depth 1 https://github.com/lavie/runlike.git

pushd runlike >/dev/null || exit 1

cat << 'EOF' > runlike.py
#!/usr/bin/env python
import sys
import os
import json
import click
import docker
from json import loads
from subprocess import check_output, STDOUT, CalledProcessError
from shlex import quote
import re
# --- inject runlike/inspector.py ---
EOF


(
grep -v "import" runlike/inspector.py
echo -e "\n# --- injest runlike/runlike.py ---"
sed -n '/@click.command/,$p' runlike/runlike.py | grep -v "from .inspector" | grep -v "from inspector"
) >> runlike.py

echo "--- done runlike.py ---"

cat runlike.py
pyinstaller \
--onefile \
--clean \
--name runlike \
--collect-all docker \
--collect-all click \
runlike.py
ls -lh ./dist
./dist/runlike --help



popd || exit 1