self: super: {
  containerd = super.containerd.overrideAttrs (old: {
    version = "2.1.1";
    src = super.fetchFromGitHub {
      owner = "containerd";
      repo = "containerd";
      rev = "v2.1.1";
      hash = "sha256-ZqQX+bogzAsMvqYNKyWvHF2jdPOIhNQDizKEDbcbmOg=";
    };
  });
}
