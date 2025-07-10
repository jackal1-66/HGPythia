ROOT=`root-config --cflags --glibs`
CXX=g++
#CXXFLAGS=-Wall -O2 -Wextra -Wno-unused-local-typedefs -Wno-deprecated-declarations -std=c++11 -Wshadow
#CXXFLAGS=`root-config --flags`
#-Wall -O2 -Wextra -Wno-unused-local-typedefs -Wno-deprecated-declarations -std=c++11 -Wshadow

MKDIR_BIN=mkdir -p $(PWD)/bin

PLIB=../pythia8315/
SETPYT=export PYTHIA8DATA=${PLIB}/share/Pythia8/xmldoc


all: mkdirBin setpyt bin/HGPYTHIA.exe

mkdirBin:
	$(MKDIR_BIN)
setpyt:
	$(SETPYT)
bin/HGPYTHIA.exe: src/HGPYTHIA.cc ../pythia8315/lib/libpythia8.a
	$(CXX) src/HGPYTHIA.cc ${PLIB}/lib/libpythia8.a -o bin/HGPYTHIA.exe  -I${PLIB}/include -pedantic -fPIC -L${PLIB}/lib -Wl,-rpath,${PLIB}/lib -lpythia8 $(ROOT) -I $(PWD)

clean:
	rm -f *~
	rm -f \#*.*#
	rm -f $(PWD)/include/#*.*#
	rm -f $(PWD)/include/*~
	rm -f $(PWD)/src/#*.*#
	rm -f $(PWD)/src/*~
	rm -f $(PWD)/bash/#*.*#
	rm -f $(PWD)/bash/*~
	rm -f $(PWD)/paths/#*.*#
	rm -f $(PWD)/paths/*~
	rm -f $(PWD)/bin/*.exe
	rmdir bin
.PHONY: all
