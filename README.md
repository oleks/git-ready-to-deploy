# Get Ready to Deploy!

`git-ready-to-deploy.sh` (pronounced "get ready to deploy") is a
simple script to ensure that the local clone is clean (no uncommitted
changes), and there are no local commits to be pushed upstream.

This is useful in a manual deployment setting, where you want to
ensure that:

  1. Nothing uncommitted gets deployed.
  2. Nothing not yet applied upstream gets deployed.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/oleks/git-ready-to-deploy/blob/master/LICENSE)

## Where's the Shell Script?

To ensure proper accreditation to this repository, and reduce code
duplication, `git-ready-to-deploy.sh` is generated from [an m4
template](git-ready-to-deploy.m4):

  1. Type `make` to build it, if you already have the [m4 macro
processor](https://www.gnu.org/software/m4/m4.html) installed, or;
  2. fetch [the latest release of the shell
script](https://github.com/oleks/git-ready-to-deploy/releases/latest).
