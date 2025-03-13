
# Rust Hello

```
Hello, world!
```

## Setting up: rustup

- https://rustup.rs/ (Download Page)

```sh
# Download Command
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Creating a Project

```sh
# option 1: cargo new
cargo new hello # new folder
cd hello

# option 2: cargo init
mkdir hello && cd hello
cargo init --name hello # current folder
```

- `Cargo.toml`
- `src/`
	- `main.rs`

## Cargo.toml

```toml
[package]
name = "hello"
version = "0.1.0"
edition = "2024"
```

## src/main.rs

```rust
fn main() {
	println!("Hello, world!");
}
```

## Build & Run

```sh
# check only
cargo check

# build only
cargo build

# build & run
cargo run
```

## Result

```
Hello, world!
```
