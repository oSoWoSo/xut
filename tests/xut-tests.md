# clitest – Command Line Tester

clitest is a [portable][1] POSIX shell script that performs automatic
testing in Unix command lines.

It's the same concept as in Python's [doctest][2] module: you document
both the commands and their expected output, using the familiar
interactive prompt format, and a specialized tool tests them.

In fact, the doctest [official][3] description can also be used for
clitest:

* The **doctest** module searches for pieces of text that look like
  interactive **Python sessions**, and then executes those **sessions**
  to verify that they work exactly as shown.

* The **clitest** command searches for pieces of text that look like
  interactive **Unix command lines**, and then executes those
  **command lines** to verify that they work exactly as shown.


## Download & install

The full program is just [a single shell script file][4].

Save it, make it executable and move it to a `$PATH` directory:

```bash
curl -sOL https://raw.githubusercontent.com/aureliojargas/clitest/master/clitest
chmod +x clitest
sudo mv clitest /usr/bin
```

Now check if everything is fine:

```
clitest --help
```


## Quick Intro

Save the commands and their expected output in a text file:

♦ [examples/intro.txt][5]

```
$ echo "Hello World"
Hello World
$
```

## CLI Syntax

There's no syntax to learn.

The test files are identical to the good old command line interface
(CLI) you're so familiar

That's it.

Just paste your shell session inside a text file and you have a
ready-to-use test suite.

## Testable Documentation

Clitest can also **extract and run command lines from documentation**,
such as Markdown files. This very `README.md` file you are now reading
is testable with `clitest README.md`. All the command lines inside it
will be run and checked.

No more malfunctioning shell commands in your READMEs, you can have
testable documentation.


It is a technical article, not a boring code-only test file.


## Alternative Syntax: Inline Output

Now a nice extension to the original idea. Using the special marker
`#=>` you can embed the expected command output at the end of the
command line.

```console
$ echo "foo"                      #=> foo
$ echo $((10 + 2))                #=> 12
```

This is the same as doing:

```console
$ echo "foo"
foo
$ echo $((10 + 2))
12
$
```

Inline outputs are very readable when testing series of commands that
result in short texts.

> Note: If needed, you can change this marker (i.e., to `#→` or `###`)
> at the top of the script or using the `--inline-prefix` option.


## Advanced Tests

When using the `#=>` marker, you can take advantage of special options
to change the default output matching method.

```console

$ echo "abcdef" | cut -c 1-4  #=> abcd
$ head /etc/passwd            #=> --lines 4
$ tac /etc/passwd | tac       #=> --file /etc/passwd
$ cat /etc/passwd             #=> --egrep ^root:
$ echo $((2 + 10))            #=> --regex ^\d+$
$ make test                   #=> --exit 2
$ pwd                         #=> --eval echo $PWD
```

* Using `#=> --lines` the test will pass if the command output has
  exactly `N` lines. Handy when the output text is variable
  (unpredictable), but the number of resulting lines is constant.

* Using `#=> --file` the test will pass if the command output matches
  the contents of an external file. Useful to organize long/complex
  outputs into files.

* Using `#=> --egrep` the test will pass if `grep -E` matches at least
  one line of the command output.

* Using `#=> --regex` the test will pass if the command output is
  matched by a [Perl regular expression][9]. A multiline output is
  matched as a single string, with inner `\n`'s. Use the `(?ims)`
  modifiers when needed.

* Using `#=> --exit` the test will pass if the exit code of the command
  is equal to the code specified. Useful when testing commands that
  generate variable output (or no output at all), and the exit code is
  the best indication of success. Both STDIN and STDOUT are ignored
  when using this option.

* Using `#=> --eval` the test will pass if both commands result in the
  same output. Useful to expand variables which store the full or
  partial output.


## Exit codes

* `0` - All tests passed, or normal operation (--help, --list, …)
* `1` - One or more tests have failed
* `2` - An error occurred (file not found, invalid range, …)


## Fail fast

Use the `--first` option (or the short version `-1`) to abort the
execution when any test fails.

Useful for Continuous Integration (CI), or when running sequential
tests where the next test depends on the correct result of the
previous.


## Nerdiness

* Use any text file format for the tests, it doesn't matter. The command
  lines just need to be grepable and have a fixed prefix (or even none).
  Even Windows text files (CR+LF) will work fine.

* The command line power is available in your test files: use variables,
  pipes, redirection, create files, folders, move around…

* All the commands are tested using a single shell session. This means
  that variables, aliases and functions defined in one test will persist
  in the following tests.

* Both STDOUT and STDERR are captured, so you can also test error
  messages.

* To test STDOUT/STDERR and the exit code at the same time, add a
  `;echo $?` after the command.

* Use an empty `$` prompt to close the last command output.

* In the output, every single char (blank or not) counts. Any
  difference will cause a test to fail. To ignore the difference in
  blanks, use `--diff-options '-u -w'`.

* Unlike doctest's `<BLANKLINE>`, in clitest blank lines in the
  command output aren't a problem. Just insert them normally.

* To test outputs with no final `\n`, such as `printf foo`, use `#=>
  --regex ^foo$`.

* In multifile mode, the current folder (`$PWD`) is reset when
  starting to test a new file. This avoids that a `cd` command in a
  previous file will affect the next.

* Multiline prompts (`$PS2`) are not yet supported.

* Ellipsis (as in doctest) are not supported. Use `#=> --regex`
  instead.

A shell script to test shell commands.
No other language or environment involved.

$ echo "End of clitest preview tests"
End of clitest preview tests
$

# clitest xut

$ echo "Start testing 'xut'"
Start testing 'xut'
$

## TEST 0 - Install xut

Install xut for all users

```bash
$ cd /workspace/oSoWoSo/xut
$ sudo make install
$

## Test 1 - xut help

Test number of lines in xut help

```bash
$ xut -h     #=> --lines 21
```

## Test 2 - xut sync

Test if xut sync repos correctly

```bash
$ xut -s     #=> --exit 0
```

## Test 3 - xut sync with log

Test xut sync with log

```bash
$ xut -sl     #=> --exit 0
```

## Test 4 - xut update

Test if update works

```bash
$ xut -u     #=> --exit 0
```

## Test 5 - xut search

Test if search for bash works

```bash
$ xut -q bash     #=> --egrep ^abyss-packages|void-packages
```

## Test 6 - xut build

Test if xut will build gum

```bash
$ xut -b gum     #=> --egrep Successfully build gum
```

## Test 7 - xut install

Test if xut will install vsv without sudo
Expected fail

```bash
$ xut -i vsv     #=> --egrep vsv installed
```

## Test 8 -

## Test 8 - run xut as root

```bash
Expected to fail!
$ xut -h         #=> --exit 1
```

## Test 9 -

#TODO empty test

```bash
$ echo

$
```

## Test 10 -

#TODO empty test

```bash
$ echo

$
```

## Test 11 -

#TODO empty test

```bash
$ echo

$
```

## Test 12 -

#TODO empty test

```bash
$ echo

$
```

## Test 13 -

#TODO empty test

```bash
$ echo

$
```

## Test 14 -

#TODO empty test

```bash
$ echo

$
```

## Test 15 -

#TODO empty test

```bash
$ echo

$
```

## Test 16 -

#TODO empty test

```bash
$ echo

$
```

$ echo "End of all tests"
End of all tests
$
