build:
	jekyll build
	git checkout gh-pages
	mv _site/* .
	rmdir _site
	git add .
