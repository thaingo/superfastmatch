mkdir external
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	curl -L http://download.savannah.gnu.org/releases/libunwind/libunwind-1.0.1.tar.gz -o external/libunwind-1.0.1.tar.gz
fi
curl http://ctemplate.googlecode.com/files/ctemplate-2.0.tar.gz -o external/ctemplate-2.0.tar.gz
curl http://gperftools.googlecode.com/files/google-perftools-1.10.tar.gz -o external/google-perftools-1.10.tar.gz
curl http://gflags.googlecode.com/files/gflags-2.0.tar.gz -o external/gflags-2.0.tar.gz
curl http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.72.tar.gz -o external/kyotocabinet-1.2.72.tar.gz
curl http://fallabs.com/kyototycoon/pkg/kyototycoon-0.9.52.tar.gz -o external/kyototycoon-0.9.52.tar.gz
curl http://www.oberhumer.com/opensource/lzo/download/lzo-2.06.tar.gz -o external/lzo-2.06.tar.gz
curl http://sparsehash.googlecode.com/files/sparsehash-2.0.1.tar.gz -o external/sparsehash-2.0.1.tar.gz

cd external && for i in *.tar.gz; do tar xzvf $i; done
if [[ "$unamestr" == 'Linux' ]]; then
	cd libunwind* && CFLAGS=-U_FORTIFY_SOURCE ./configure && make && sudo make install && cd ..
fi
cd ctemplate* && ./configure && make && sudo make install && cd ..
cd google-perftools* && ./configure && make && sudo make install  && cd ..
cd gflags* && ./configure && make && sudo make install  && cd ..
cd kyotocabinet* && ./configure && make && sudo make install && cd ..
cd kyototycoon* && ./configure && make && sudo make install && cd ..
cd sparsehash* && ./configure && make && sudo make install && cd ..
cd lzo-2.06 && ./configure && make && sudo make install && cd ..
cd ..
