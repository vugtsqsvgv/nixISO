{config, lib, pkgs, ...}:{

services = {
 openssh.enable = true;
 envfs.enable = true;
 displayManager= {
  sddm = {
 enable = true;
 wayland.enable = true;
};
autoLogin = {
    enable = true;
    user = "user";
  };
 };
 pipewire = {

	enable = true;
	pulse.enable = true;


 };
};
	

}
