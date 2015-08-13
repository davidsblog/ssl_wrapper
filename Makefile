DEFS = -DNS_ENABLE_SSL $(CFLAGS_EXTRA)
CFLAGS = -W -Wall -O2 -pthread -lcrypto -lssl $(DEFS)
SOURCES = ssl_wrapper.c net_skeleton.c

ifeq ($(OS),Windows_NT)
 	# Windows build. Assumes that Visual Studio is installed at $(VC)
	VC = ../vc6
  OSSL = ../openssl-0.9.8
	CC = $(VC)/bin/cl
	CFLAGS = /MD /TC /nologo /W3 /I$(VC)/include /I$(OSSL)/include $(DEFS)
	CFLAGS += /link /incremental:no /libpath:$(VC)/lib /machine:IX86 $(OSSL)/lib/ssleay32.lib
endif

ssl_wrapper: $(SOURCES)
	$(CC) -o $@ $(SOURCES) $(CFLAGS)

install:
	ln -s ~/ssl_wrapper /usr/local/bin/
	cp -n init_script /etc/init.d/sslwrappersvc
	chmod +x /etc/init.d/sslwrappersvc
	update-rc.d sslwrappersvc defaults
	/etc/init.d/sslwrappersvc start

uninstall:
	/etc/init.d/sslwrappersvc stop
	update-rc.d -f sslwrappersvc remove
	rm -f /etc/init.d/sslwrappersvc
	rm -f /usr/local/bin/ssl_wrapper

clean:
	rm -rf ssl_wrapper ssl_wrapper.exe *.o *.obj *.dSYM
