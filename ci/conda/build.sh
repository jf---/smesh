# Configure step
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DMACOSX_RPATH=$PREFIX/lib \
 -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_PREFIX_PATH=$PREFIX \
 -DCMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
 -DSMESH_TESTING=ON \
 .

# Build step
make -j 4

# links libs
make install

otool -L /Users/travis/miniconda/envs/_build/lib/libSMESH.dylib

# test
make test

otool -L /Users/jelleferinga/GIT/smesh/test/MeshBasicGeometries_test/MeshBasicGeometries_test

# Install step
# redirect stdout stream to a file because of many boost header files
make install > installed_files.txt

