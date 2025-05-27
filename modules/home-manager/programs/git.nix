{ ... }:
{
  programs.git = {
    enable = true;
    signing = {
      format = "openpgp";
      key = "ed25519/0363B60B213CB2BB";
      signByDefault = true;
    };
    userEmail = "131378214+yunusemre12500@users.noreply.github.com";
    userName = "yunusemre12500";
  };
}
