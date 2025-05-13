#!/usr/bin/env bash
set -euo pipefail

nix run --extra-experimental-features 'nix-command flakes' .#homeConfigurations.default.activationPackage

