# Setup

Run first time
```sh
nix run --experimental-features 'nix-command flakes' .#homeConfigurations.<host>.activationPackage
```

Then
```home-manager switch .#<host>
```