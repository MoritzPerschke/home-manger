{
	description = "Cross-machine home-manager config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }:
		let
			username = builtins.getEnv "USER";
			homeDirectory = builtins.getEnv "HOME";

			pkgs = import nixpkgs {
				system = builtins.currentSystem;
				config.allowUnfree = true;
			};
		in 
		{
			homeConfigurations."default" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit username homeDirectory; };
				modules = [
					./home.nix
					{
						home.username = username;
						home.homeDirectory = homeDirectory;
					}
				];
			};
			# Could add additional profiles here, default should be fine for now
		};
}
