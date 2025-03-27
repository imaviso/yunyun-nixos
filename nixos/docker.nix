{ pkgs, ...}: {
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose # start group of containers for dev
  ];
}
