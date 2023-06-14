function switchgo() {
	version=$1
	if [ -z $version ] || [ $# -ne 1 ]; then
		echo "Usage: switchgo [version]"
		return 1
	fi

	if [ -z $GOBIN ]; then
		echo "\$GOBIN is not set"
		return 1
	fi

	if ! command -v $GOBIN/go$version > /dev/null 2>&1; then
		echo "Go $version doesn't exist, start downloading..."
		if [ $(go version | grep -Eo "[1-9][0-9]+" | head -1) -ge 16 ]; then
			go install golang.org/dl/go$version@latest
		else
			go get golang.org/dl/go$version
		fi

		if ! command -v $GOBIN/go$version > /dev/null 2>&1; then
			return 1
		fi

		$GOBIN/go$version download
	fi

	ln -sf $(command -v $GOBIN/go$version) $GOBIN/go

	echo "Switched to Go $version"
}

