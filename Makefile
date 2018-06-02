.PHONY: git-ready-to-deploy.sh clean

git-ready-to-deploy.sh: git-ready-to-deploy.m4 LICENSE Makefile
	m4 $< > $@
	chmod +x $@

clean:
	rm -f git-ready-to-deploy.sh
