#!/usr/bin/env bash


pip install docker click pyinstaller
git clone -b $1 --depth 1 https://github.com/lavie/runlike.git

pushd runlike >/dev/null || exit 1

cat << 'EOF' > runlike_single.py
#!/usr/bin/env python
import sys
import os
import json
import click
import docker

# --- inject runlike/inspector.py ---
EOF


(
grep -v "import" runlike/inspector.py
echo -e "\n# --- injest runlike/runlike.py ---"
sed -n '/@click.command/,$p' runlike/runlike.py | grep -v "from .inspector" 
) >> runlike_single.py

echo "--- done runlike_single.py ---"

cat runlike_single.py
pyinstaller \
--onefile \
--clean \
--name runlike_final \
--collect-all docker \
--collect-all click \
runlike_single.py
ls -lh ./dist
./dist/runlike_final --help



popd || exit 1