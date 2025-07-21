{ self, ...}: {
  nixpkgs = {
    config.allowUnfree = true;

    config.permittedInsecurePackages = [
      "electron-33.4.11"
    ];
  };

}
