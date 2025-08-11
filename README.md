# DepIn (dependency installer)

depin is a simple bash script designed as a tool for helping with installing required packages from a dotfile (config file) repository.
It can read all the dependencies from a simple YAML file and in case a package has different names in different software repositories it can automatically select the correct one if configured properly.

Depin doesn't perform any permanent operations on the system, it only prints the package names to the output, which then can be used by a package manager. This makes it rather safe to use but still:

THIS PROGRAM COMES WITH NO WARRANTY, USE AT YOUR OWN RISK

---

## Installation

### Manual
1. Clone the git repo: `git clone https://github.com/JacksStuff0905/depin.git`
2. Enter the repo directory: `cd depin`
3. Run the install script: `./install.sh`
4. Exit the repo directory: `cd ..`
5. Remove the repo directory: `rm -r depin`

*Uninstalling*
1. Clone the git repo (if you haven't already): `git clone https://github.com/JacksStuff0905/depin.git`
2. Enter the repo directory: `cd depin`
3. Run the uninstall script: `./uninstall.sh`
4. Exit the repo directory: `cd ..`
5. Remove the repo directory: `rm -r depin`

---

## TL;DR

Syntax:
    `depin [OPTION ...] DEPENDENCIES_FILE PACKAGE_MANAGER`

Where the `DEPENDENCIES_FILE` is the filepath of the YAML file containing the dependencies and `PACKAGE_MANAGER` is an optional field where the package manager command is to be placed, e.g. apt, pacman, dnf, brew, yay, etc. (WITHOUT SUDO OR ANYTHING ELSE!!!)

Depin will output a string of all the needed package names, like so: `package1 package2 package3`. This is in order for depin to be put into a package install command without to much hassle: `sudo apt install $(depin dependencies.yaml apt)` or `sudo pacman -S $(depin dependencies.yaml pacman)`, etc.

---

## Dependencies file syntax

The dependencies file is formatted as a YAML file which looks like this:
```
package1:
    apt: pkg1
    pacman: package_1
    other: package1
```

Where each package has it's respective name for every package manager specified in itself. In this example, if the specified package manager is `apt`, depin will determine that `package1` should be installed as `pkg1`. If the current package manager was pacman the result would be `package_1`. In the case that the specified package manager's package name is not specified, depin will default to the `other` category, in this case, if the user used `dnf`, depin would return `package1`.

If there's no need to specify different package names, e.g. all software repositories use the same name, instead of writing
```
package2:
    other: pkg2
```
you can use the shorthand syntax of
```
package2: pkg2
```
which will give the same result.

Moreover, you can just use the shortest syntax of
```
pkg3
```
which will be parsed as `pkg3: pkg3`. If you use this syntax, it's important NOT to put a colon `:` at the end of the line.

So, the complete config file would look like this:
```
package1:
    apt: pkg1
    pacman: package_1
    other: package1

package2: pkg2

pkg3
```

*Real world example:*
```
neovim: neovim

git

ripgrep:
    apt: rg
    other: ripgrep
```

---

## TODO

This project is very simple, I have no plans of adding more features, unless I feel they're needed, If any bugs appear, which I doubt due to the simplicity of the script, I might fix them if I find the time to.

---

Thanks to Stefan Farestam for the parse_yaml function which he posted on Stack Overflow, which I slightly modified specifically for depin.
