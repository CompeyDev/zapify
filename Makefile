all: build

test: build clean

build:
	./build.sh && echo -e "\n"

clean:
	./clean.sh && echo -e "\n"
