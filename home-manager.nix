{config, lib, pkgs,p10k, dotfiles, oh-my-zsh, inputs, ...}:

{
imports = 
[
  inputs.home-manager.nixosModules.home-manager
];

security.pam.makeHomeDir.skelDirectory = "/etc/skel";

home-manager = {
useUserPackages = true;
useGlobalPkgs = true; 
backupFileExtension = "backup" ;
extraSpecialArgs = {inherit p10k dotfiles oh-my-zsh;};
users.user = import ./home.nix;
};

}
