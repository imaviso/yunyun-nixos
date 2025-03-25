{
  programs.corectrl = {
    enable = true;
    gpuOverclock.ppfeaturemask = {
      enable = true;
      ppfeaturemask = "0xffffffff";
    };
  };
}
