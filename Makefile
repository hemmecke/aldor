build:
	jekyll build -d .site
	git checkout gh-pages
	rm -r *
	mv .site/* .
	rmdir .site
	git add .
