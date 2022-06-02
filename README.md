# nixos-config
My [NixOS](https://nixos.org/) config

## Usage

- With a [flakes-enabled](https://nixos.wiki/wiki/Flakes) Nix version, and
- As a non-root user:

### Update flake inputs

```sh
nix flake update
```

### Switch system

```sh
nixos-rebuild switch --use-remote-sudo --flake <path-to-git-repo>
```

### Switch home

```sh
home-manager switch --flake <path-to-git-repo>
```

### One liner (update inputs and switch home and system)

```
pushd <path-to-git-repo> && nix flake update && nixos-rebuild switch --use-remote-sudo --flake . && home-manager switch --flake . && popd
```