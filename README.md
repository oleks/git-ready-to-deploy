# Stay Up-To-Date with Your Remote

`gitsync.sh` (based on [`gitsync.m4`](gitsync.m4)) is a simple script
to ensure that a local clone is in sync with a remote.

That is, no local, non-committed changes, and no new commits to be
applied upstream (pushed to the default remote).

This is useful in a manual deployment setting, where you want to
ensure that:

  1. Nothing uncommitted gets deployed.
  2. Nothing not yet applied upstream gets deployed.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/oleks/gitsync/blob/master/LICENSE)

## Where's the Shell Script?

To ensure proper accreditation to this repository, and reduce code
duplication, `gitsync.sh` is generated from [an m4
template](gitsync.m4). Simply type `make` to build it, if you already
have the [m4 macro processor](https://www.gnu.org/software/m4/m4.html)
installed, or simply fetch [the latest release of the shell
script](https://github.com/oleks/gitsync/releases/latest).
