{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {

	url = "github:nix-community/home-manager/release-26.05";
	inputs.nixpkgs.follows = "nixpkgs";

    };

    dotfiles = {

	url = "github:vugtsqsvgv/Dot-Files/main";
	flake = false;

    };

    oh-my-zsh = {

	url = "github:ohmyzsh/ohmyzsh/master";
	flake = false;

    };
    p10k = {

	url = "github:romkatv/powerlevel10k/master" ;
	flake = false ;

    };

  };

  outputs = {self, nixpkgs, dotfiles, oh-my-zsh,p10k, home-manager, ...}: {
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {

	system = "x86_64-linux";
	specialArgs = {inherit dotfiles oh-my-zsh p10k; inputs = self.inputs;} ;
	modules = [
  ({ pkgs, modulesPath, ... }:{
      imports = [(modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares.nix")];
    })
	./configuration.nix
	./home-manager.nix
	];
    };
  };
}
