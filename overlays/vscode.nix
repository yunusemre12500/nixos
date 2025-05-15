self: super: {
  vscodium = super.vscodium.overrideAttrs (old: {
    version = "1.100.23258";
    src = super.fetchurl {
      url = "https://github.com/VSCodium/vscodium/releases/download/1.100.23258/VSCodium-linux-x64-1.100.23258.tar.gz";
      sha256 = "sha256-6/ECgQbl7r4KI66BApOijIdJJP4nlDEgRE1JEMJcSDk=";
    };
  });
}
