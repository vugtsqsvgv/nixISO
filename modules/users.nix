{config, lib, pkgs, ...}:{

users = {
 defaultUserShell = pkgs.zsh;
 users.user = {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
   packages = with pkgs; [
   ];
};
};

environment.shells = [pkgs.zsh];


}
