# nixos-config

My [NixOS](https://nixos.org/) config

## Usage

-   With a [flakes-enabled](https://nixos.wiki/wiki/Flakes) Nix version, and
-   As a non-root user:

### Update flake inputs

```sh
nix flake update --commit-lock-file
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
pushd <path-to-git-repo> && nix flake update --commit-lock-file && nixos-rebuild switch --use-remote-sudo --flake .; home-manager switch --flake . && popd
```

## Inputs

-   `nixos-unstable` - Unstable channel
-   `nixos-unstable-small` - Unstable small channel, used for broken packages that have been fixed when unstable is blocked
-   `nixos-unstable-lagging` - Unstable channel, fixed to a particular commit, used for recently broken packages
-   `home-manager`
