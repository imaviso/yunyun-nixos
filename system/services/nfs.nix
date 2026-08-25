# NFS server exporting the same media shares as SMB, no auth (LAN only)
{
  services.nfs.server = {
    enable = true;

    exports = ''
      /export         192.168.254.0/24(rw,fsid=0,no_subtree_check)
      /export/media   192.168.254.0/24(rw,nohide,insecure,no_subtree_check)
      /export/media2  192.168.254.0/24(rw,nohide,insecure,no_subtree_check)
    '';
  };

  # Bind-mount the media drives under /export so NFS can export them.
  # Clients' uid/gid map straight through (no_root_squash), so files
  # are created as the connecting user, like SMB's force user = yunyun.
  fileSystems."/export/media" = {
    device = "/mnt/media";
    fsType = "none";
    options = ["bind"];
  };

  fileSystems."/export/media2" = {
    device = "/mnt/media2";
    fsType = "none";
    options = ["bind"];
  };
}
