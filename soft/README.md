Place extra applications here, for example: datax.


```shell
# configure
export PYTHON_VERSION=2.7 &&
  ./configure \
      --prefix=/opt/soft/${PYTHON_VERSION} \
      --enable-shared \
      --enable-optimizations \
      --enable-ipv6 \
      LDFLAGS=-Wl,-rpath=/opt/python/${PYTHON_VERSION}/lib,--disable-new-dtags

# make & install
make && make install
```