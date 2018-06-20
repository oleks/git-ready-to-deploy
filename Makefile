.PHONY: clean

HEAD_PATH=.git/$(shell cat .git/HEAD | cut -d' ' -f2)

git-ready-to-deploy.sh: \
		git-ready-to-deploy.m4 \
		LICENSE \
		Makefile \
		$(HEAD_PATH)
	m4 -D "HEAD_PATH=$(HEAD_PATH)" $< > $@
	chmod +x $@

clean:
	rm -f git-ready-to-deploy.sh
