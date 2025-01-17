all:
	bazel test -c dbg //...
	bazel build -c opt //:diskimages
	for a in $$(dirname bazel-bin/arch/*/diskimage.img); do f=$$(basename $$a); ln -sf bazel-bin/arch/$$f/diskimage.img $$f.img; done

verbose:
	bazel test -s -c dbg //...
	bazel build -s -c opt //:diskimages

