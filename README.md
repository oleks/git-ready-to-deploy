# Get Ready to Deploy!

`git-ready-to-deploy.sh` (pronounced "get ready to deploy") can ensure
that the local clone is clean (no uncommitted changes), and that there
are no local commits to be pushed upstream.

This is useful in a manual deployment setting, where you want to
ensure that:

  1. Nothing uncommitted gets deployed.
  2. Nothing not yet applied upstream gets deployed.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/oleks/git-ready-to-deploy/blob/master/LICENSE)

## Where's the Shell Script?

To ensure proper accreditation, manage releases, and reduce code
duplication, `git-ready-to-deploy.sh` is generated from [an m4
template](git-ready-to-deploy.m4). To get the shell script, either:

  1. Type `make` to build it, if you already have the [m4 macro
processor](https://www.gnu.org/software/m4/m4.html) installed, or;
  2. Fetch the
[latest](https://github.com/oleks/git-ready-to-deploy/releases/latest)
[release](https://github.com/oleks/git-ready-to-deploy/releases) of
the shell script.

## Target Audience

This script should be used only if applicable in your deployment
process. In particular, a deployment process where someone, perhaps a
bot, can pull, make changes, and *can* deploy without committing and
pushing back first.

In this scenario, this script is best-used as an integral part of your
"deploy script". `git-ready-to-deploy.sh` fails, if there are changes
to be committed, or pushed. If used properly, it can prohibit
deployment of ill-versioned code.

Alternative deployment strategies include push-to-deploy, or
push-to-staging, with a subsequent process for deploying from staging.
This script is unlikely to be useful in these scenarios.

## Community Review

Discussed on [Hacker
News](https://news.ycombinator.com/item?id=17213891).
