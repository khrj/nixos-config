# nixos-config
My [NixOS](https://nixos.org/) config

## Usage

- With a [flakes-enabled](https://nixos.wiki/wiki/Flakes) Nix version, and
- As a non-root user:

### Activate system

```sh
nixos-rebuild switch --use-remote-sudo --flake <path-to-git-repo>
```

### Update flake

```sh
nix flake update
```

### One liner (update system)

```
pushd <path-to-git-repo> && nix flake update && nixos-rebuild switch --use-remote-sudo --flake . && popd
```