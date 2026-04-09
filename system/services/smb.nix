{
  pkgs,
  config,
  ...
}: {
  services = {
    samba = {
      # The full package is needed to register mDNS records (for discoverability), see discussion in
      # https://gist.github.com/vy-let/a030c1079f09ecae4135aebf1e121ea6
      # package = pkgs.samba4Full;
      usershares.enable = true;
      enable = true;
      openFirewall = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "vfs objects" = "streams_xattr";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          #"use sendfile" = "yes";
          #"max protocol" = "smb2";
          # note: localhost is the ipv6 localhost ::1
          "hosts allow" = "192.168.254. 127.0.0.1 localhost";
          "hosts deny" = "0.0.0.0/0";
          "guest account" = "nobody";
          "map to guest" = "bad user";
        };
        "media" = {
          "path" = "/mnt/media2";
          "browseable" = "yes";
          "read only" = "no";
          "guest ok" = "yes";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "yunyun";
          "force group" = "users";
        };
        "yunyun" = {
          "path" = "/mnt/media/samba";
          "browseable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0600";
          "directory mask" = "0700";
          "force user" = "yunyun";
          "force group" = "users";
        };
        "vianney" = {
          "path" = "/mnt/media2/samba/vianney";
          "browseable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "vianney";
          "force group" = "users";
        };
      };
    };

    # To be discoverable with windows
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };

    avahi = {
      publish.enable = true;
      publish.userServices = true;
      # ^^ Needed to allow samba to automatically register mDNS records (without the need for an `extraServiceFile`
      nssmdns4 = true;
      # ^^ Not one hundred percent sure if this is needed- if it aint broke, don't fix it
      enable = true;
      openFirewall = true;
    };
  };

  # Make sure your user is in the samba group
  users.users.yunyun = {
    isNormalUser = true;
    extraGroups = ["samba"];
  };

  users.users.vianney = {
    isNormalUser = true;
    extraGroups = ["samba"];
  };
}
