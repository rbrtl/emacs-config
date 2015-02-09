# Portable emacs config

This is my emacs config. After cloning and starting, it will bootstrap
all packages and custom config.

## Setup

* Clone the repository.
* Copy ```.emacs``` to the default location.
* Set the correct path to the git repo in ```.emacs```.
* Start emacs.

## Package install

There are two possible senario exists.

* Use the built-in package manager to install packages. Then put the package name to ```installed-packages.conf```.
* List your desired package names in ```installed-packages.conf```. Then use ```M-x install-all-packages``` to install all new packages.

