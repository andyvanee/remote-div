SHELL:=/bin/bash

default: docs/remote-div.min.js docs/api/about.html

docs/remote-div.min.js: src/custom-elements.min.js src/remote-div.js
	cat $^ > $@

docs/api/about.html: README.md
	@marked $? > $@
