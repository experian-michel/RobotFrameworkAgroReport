# chmod +x run_tests.sh

#!/bin/bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
robot -d results tests/

