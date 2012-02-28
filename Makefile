all: public/album/belly.json public/album/ultra-20.json public/album/ultra-29.json public/album/belly.html public/album/ultra-20.html public/album/ultra-29.html public/index.html public/nursery.html public/ajax/album/belly.html public/ajax/album/ultra-20.html public/ajax/album/ultra-29.html public/ajax/index.html public/ajax/nursery.html public/modernizr-2.0.6.js public/script.js public/style.css

public/ajax:
	mkdir public/ajax

public/album:
	mkdir public/album

public/ajax/album: public/ajax
	mkdir public/ajax/album

public/album/belly.json: public/album albums/belly.json
	cp albums/belly.json public/album/belly.json

public/album/ultra-20.json: public/album albums/ultra-20.json
	cp albums/ultra-20.json public/album/ultra-20.json

public/album/ultra-29.json: public/album albums/ultra-29.json
	cp albums/ultra-29.json public/album/ultra-29.json

public/album/belly.html: public/album page.php album.php util/minifier.js albums/belly.json
	php page.php album belly | node util/minifier.js > public/album/belly.html

public/album/ultra-20.html: public/album page.php album.php util/minifier.js albums/ultra-20.json
	php page.php album ultra-20 | node util/minifier.js > public/album/ultra-20.html

public/album/ultra-29.html: public/album page.php album.php util/minifier.js albums/ultra-29.json
	php page.php album ultra-29 | node util/minifier.js > public/album/ultra-29.html

public/index.html: page.php util/minifier.js pages/index.html
	php page.php pages/index.html | node util/minifier.js > public/index.html

public/nursery.html: page.php util/minifier.js pages/nursery.html
	php page.php pages/nursery.html | node util/minifier.js > public/nursery.html

public/ajax/album/belly.html: public/ajax/album album.php util/minifier.js albums/belly.json
	php album.php belly | node util/minifier.js > public/ajax/album/belly.html

public/ajax/album/ultra-20.html: public/ajax/album album.php util/minifier.js albums/ultra-20.json
	php album.php ultra-20 | node util/minifier.js > public/ajax/album/ultra-20.html

public/ajax/album/ultra-29.html: public/ajax/album album.php util/minifier.js albums/ultra-29.json
	php album.php ultra-29 | node util/minifier.js > public/ajax/album/ultra-29.html

public/ajax/index.html: public/ajax pages/index.html
	node util/minifier.js < pages/index.html > public/ajax/index.html

public/ajax/nursery.html: public/ajax pages/nursery.html
	node util/minifier.js < pages/nursery.html > public/ajax/nursery.html

public/modernizr-2.0.6.js: js/modernizr-2.0.6.js
	yuicompressor js/modernizr-2.0.6.js > public/modernizr-2.0.6.js

public/script.js: js/script.js
	yuicompressor js/script.js > public/script.js

public/style.css: css/style.css
	yuicompressor css/style.css > public/style.css

clean:
	rm public/*.{js,css,html}
	rm -r public/ajax public/album
