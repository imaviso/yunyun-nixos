{ pkgs, ... }:
{

  # programs.chromium = {
  #   enable = true;
  #   package = pkgs.ungoogled-chromium;
  #   commandLineArgs = [
  #     "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true --flag-switches-begin --extension-mime-request-handling=always-prompt-for-install --flag-switches-end --ozone-platform=wayland --render-node-override=/dev/dri/renderD128 --use-gl=angle --use-angle=vulkan --enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --ignore-gpu-blocklist --disable-gpu-driver-bug-workaround"
  #   ];
  # };
  environment.systemPackages = [
    pkgs.ungoogled-chromium
  ];
  # nixpkgs.config.chromium.commandLineArgs = "--use-gl=angle --use-angle=vulkan --enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --ignore-gpu-blocklist --disable-gpu-driver-bug-workaround";
}
