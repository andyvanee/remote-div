SHELL:=/bin/bash

RD=$(shell babel src/remote-div.js --presets es2016)
CE=$(shell cat src/custom-elements.min.js)
default: docs/remote-div.min.js docs/api/about.html

docs/remote-div.min.js: src/custom-elements.min.js src/remote-div.js
	babel src/custom-elements.min.js src/remote-div.js --presets es2015 | uglifyjs > $@

docs/api/about.html: README.md
	@marked $? > $@
