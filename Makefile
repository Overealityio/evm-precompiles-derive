all: release

lint:
	cargo clippy
	cargo check --tests
	cargo check --benches

test:
	cargo test  -- --test-threads=1 --ignored

bench:
	cargo bench

build:
	cargo build

release:
	if [[ "Linux" == `uname -s` ]]; then\
	    cargo build --release --target=x86_64-unknown-linux-musl;\
	else\
	    cargo build --release;\
	fi

fmt:
	bash tools/fmt.sh

clean:
	cargo clean
	git stash
	git clean -fdx

update:
	cargo update

doc:
	cargo doc --open
