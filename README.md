# Home Manager config for use across any machine i might use
## Setup
`home-manager switch --flake .#default --extra-experimental-features 'nix-command flakes' --impure -b backup`

- `--impure` is needed to get user and hostname
-  `--extra-experimental-feature ...` in case they aren't already enabled
