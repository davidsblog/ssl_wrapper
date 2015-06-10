ssl_wrapper
===========

**Note:** [see original documentation](https://github.com/cesanta/ssl_wrapper).

This is a fork of [ssl_wrapper](https://github.com/cesanta/ssl_wrapper) which I am trying to make work in Chrome without complaints of obsolete cryptography.

## Building SSL wrapper

	git clone https://github.com/cesanta/net_skeleton.git
	git clone https://github.com/cesanta/ssl_wrapper.git
	cd ssl_wrapper
	make

Note: SSL Wrapper is built on top of
[Net Skeleton](https://github.com/cesanta/net_skeleton), and therefore
it is portable and works on may operating systems including Windows, MacOS, UNIX/LINUX, QNX, eCos, Android, iOS, and more.

## License

SSL Wrapper is released under
[GNU GPL v.2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
Businesses have an option to get non-restrictive commercial
license and professional support from [Cesanta Software](http://cesanta.com).
