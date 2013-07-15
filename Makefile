build:
	jekyll build
	git checkout gh-pages
	rm -r *
	mv _site/* .
	rmdir _site
	git add .
