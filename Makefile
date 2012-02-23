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

public/album/belly.html: public/album page.php album.php albums/belly.json
	./page.php album belly > public/album/belly.html

public/album/ultra-20.html: public/album page.php album.php albums/ultra-20.json
	./page.php album ultra-20 > public/album/ultra-20.html

public/album/ultra-29.html: public/album page.php album.php albums/ultra-29.json
	./page.php album ultra-29 > public/album/ultra-29.html

public/index.html: page.php pages/index.html
	./page.php pages/index.html > public/index.html

public/nursery.html: page.php pages/nursery.html
	./page.php pages/nursery.html > public/nursery.html

public/ajax/album/belly.html: public/ajax/album album.php albums/belly.json
	./album.php belly > public/ajax/album/belly.html

public/ajax/album/ultra-20.html: public/ajax/album album.php albums/ultra-20.json
	./album.php ultra-20 > public/ajax/album/ultra-20.html

public/ajax/album/ultra-29.html: public/ajax/album album.php albums/ultra-29.json
	./album.php ultra-29 > public/ajax/album/ultra-29.html

public/ajax/index.html: public/ajax pages/index.html
	cp pages/index.html public/ajax/index.html

public/ajax/nursery.html: public/ajax pages/nursery.html
	cp pages/nursery.html public/ajax/nursery.html

public/modernizr-2.0.6.js: js/modernizr-2.0.6.js
	yuicompressor js/modernizr-2.0.6.js > public/modernizr-2.0.6.js

public/script.js: js/script.js
	yuicompressor js/script.js > public/script.js

public/style.css: css/style.css
	yuicompressor css/style.css > public/style.css

clean:
	rm public/*.{js,css}
	rm -r public/ajax public/album
