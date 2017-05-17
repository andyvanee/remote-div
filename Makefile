default: docs/remote-div.min.js docs/api/about.html

docs/remote-div.min.js: src/remote-div.js
	@uglifyjs $? > $@

docs/api/about.html: README.md
	@marked $? > $@
