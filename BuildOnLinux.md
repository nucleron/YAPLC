 # Build YAPLC on GNU/Linux
 ## Install dependencies:
```bash
sudo apt-get install codeblocks
sudo apt-get install build-essential bison flex autoconf
sudo apt-get install python-wxgtk2.8 pyro mercurial
sudo apt-get install python-numpy python-nevow python-matplotlib python-lxml
```
You should also install
https://launchpad.net/gcc-arm-embedded

Add arm-none-eabi-gcc toolchain to Code::Blocks IDE

 ## Preparations
```bash
mkdir ~/YAPLC
cd ~/YAPLC
```
Clone these repos:

```bash
hg clone https://bitbucket.org/skvorl/beremiz/
hg clone https://bitbucket.org/skvorl/matiec

git clone https://github.com/nucleron/RTE.git
git clone https://github.com/nucleron/IDE.git
git clone https://github.com/nucleron/freemodbus-v1.5.0.git
git clone https://github.com/nucleron/stm32flash.git
git clone https://github.com/nucleron/libopencm3.git
git clone https://github.com/nucleron/YaPySerial.git
```

 ## Build

Build matiec:
```bash
cd ~/YAPLC/matiec
autoreconf -i
./configure
make
```

Build libopencm3:

```bash
cd ~/YAPLC/libopencm3
make
```

Build stm32flash

```bash
cd ~/YAPLC/stm32flash
make
```

To build YaPySerial use Code::Blocks, the target is POSIX.
To build device runtime systems use Code::Blocks with Debug targets.

 ## Optional
 Get and build CanFestival-3:
```bash
hg clone http://dev.automforge.net/CanFestival-3
cd ~/YAPLC/CanFestival-3
./configure --can=virtual
make
```
 ## Runing YAPLC/IDE
```bash
cd ~/YAPLC/IDE
python yaplcide.py
```

 # Cross build Win setup
Install dependencies as described above
 ## Preparations
Clone this repo
```bash
mkdir ~/Build
cd ~/Build
git clone https://github.com/nucleron/YAPLC.git
```
 ## Make it
```bash
cd YAPLC
make
```

 ## Clean installer
```bash
make clean_installer
```
