{
services.nfs.server = {
  enable = true;
  exports = ''
    /export         192.168.1.201(rw,fsid=0,insecure,no_subtree_check)
    /export/media   192.168.1.201(rw,nohide,insecure,no_subtree_check) 
    /export/media2  192.168.1.201(rw,nohide,insecure,no_subtree_check)
  '';
  };
}
