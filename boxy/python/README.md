# Python implementation

```bash
cd ~/code-katas/boxy/python

python -m pip install --upgrade pip

Requirement already satisfied: pip in /opt/homebrew/Caskroom/miniconda/base/lib/python3.8/site-packages (22.2.2)

python -m venv boxy_env  # create the virtual environment

# activate the venv with one of the following:
source boxy_env/bin/activate # for bash shell
source boxy_env/bin/activate.csh # for c shell
source boxy_env/bin/activate.fish # for fish shell
source boxy_env/bin/Activate.fish # for powershell

pip list
python -m pip install --upgrade pip
```

Install `trimesh`

```bash
(boxy_env) cbh@atlas/Users/cbh/code-katas/boxy/python> pip install trimesh
Collecting trimesh
  Downloading trimesh-3.13.4-py3-none-any.whl (660 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 660.9/660.9 kB 5.6 MB/s eta 0:00:00
Collecting numpy
  Using cached numpy-1.23.1-cp38-cp38-macosx_11_0_arm64.whl (13.3 MB)
Installing collected packages: numpy, trimesh
Successfully installed numpy-1.23.1 trimesh-3.13.4
(boxy_env) cbh@atlas/Users/cbh/code-katas/boxy/python> pip list     (base)
Package    Version
---------- -------
numpy      1.23.1
pip        22.2.2
setuptools 56.0.0
trimesh    3.13.4
(boxy_env) cbh@atlas/Users/cbh/code-katas/boxy/python>
```

Examine five `.stl` files in [examples.py](examples.py).

