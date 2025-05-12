{ ... }: {
  services.openssh = {
    allowSFTP = false;
    banner = "This server used for virtualisation. Unauthorized access not allowed.";
    enable = true;
    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      PrintMotd = true;
      UsePAM = false;
      X11Forwarding = false;
    };
  };
}
