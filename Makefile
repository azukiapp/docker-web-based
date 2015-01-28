# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/web-based .

no-cache:
	adocker build --rm --no-cache -t azukiapp/web-based .
