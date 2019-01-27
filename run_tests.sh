#!/usr/bin/env bash

set -euxo pipefail

terraform --help
terraform-docs --help
failme
git-chglog --help