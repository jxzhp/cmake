rm -fr build
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=`pwd`/out ..
make && make install/strip
