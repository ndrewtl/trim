# trim

[![Build Status](https://travis-ci.com/ndrewtl/trim.svg?branch=master)](https://travis-ci.com/ndrewtl/trim)

`trim` is a simple unix-philosophy tool to trim trailing whitespace from a file.
It is designed to be simple and transparent. It takes input from stdin and
output from stdout, for easy piping.

## Usage

`trim [-N|--newlines] [-o|--output ARG] [FILE]`

`trim` with no flags takes input from stdin and prints to stdout. It trims
trailing whitespace from each line, but does not trim additional newlines.

  - `[FILE]` The file to read from. If `FILE` is a single hyphen `-` or unspecified, read from standard input.

  - `--output`, `-o` `[FILENAME]` write to the given filename instead of stdout

  - `--newlines`, `-N` Trim trailing newlines as well

## Installation

You can easily install using `cabal` as follows:

```sh
cabal v2-update && cabal v2-install trim
```

## Building
Build with `cabal v2-build`

## Testing

Test with `./test.sh`
