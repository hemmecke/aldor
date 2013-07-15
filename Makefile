build:
	jekyll build -d .site
	git checkout gh-pages
	rm -r *
	mv .site/aldor/* .
	rm -r .site
	git add -A .
	-git commit -a -m'updating generated files'
	git checkout gh-pages-source

serve:
	jekyll serve -w -d .site
