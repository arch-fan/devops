# Setup

Run first time
```sh
nix run --experimental-features 'nix-command flakes' .#<host>.homeConfigurations.default.activationPackage
```

Then
```home-manager switch .#<host>
```