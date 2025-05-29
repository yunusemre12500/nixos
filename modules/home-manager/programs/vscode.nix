{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions =
        with pkgs.vscode-extensions;
        [ rust-lang.rust-analyzer ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            hash = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
            name = "better-comments";
            publisher = "aaron-bond";
            version = "3.0.2";
          }
          {
            hash = "sha256-Q2gcuclG7NLR81HjKj/0RF0jM5Eqe2vZMbpoabp/osg=";
            name = "code-runner";
            publisher = "formulahendry";
            version = "0.12.0";
          }
          {
            hash = "sha256-uVE7sEO8XN3ArFpElUw25/BKyCOzF1EmZ5nHBkdoL/0=";
            name = "cpptools";
            publisher = "ms-vscode";
            version = "1.26.1";
          }
          {
            hash = "sha256-mw6Y/nWbP2i2+wbUz3C1pJRTJWKfuN2nidJT0vG3fgQ=";
            name = "csdevkit";
            publisher = "ms-dotnettools";
            version = "1.20.14";
          }
          {
            hash = "sha256-iLF2kxhSw39JBIs5K6hVmrEKueS8C22rnKCs+CiphwY=";
            name = "dependi";
            publisher = "fill-labs";
            version = "0.7.14";
          }
          {
            hash = "sha256-43ZAwaApQBqNzq25Uy/AmkQqprU7QlgJVVimfCaiu9k=";
            name = "discord-vscode";
            publisher = "icrawl";
            version = "5.9.2";
          }
          {
            hash = "sha256-Xi2+mN6zjIKm0HWxfRAFs2vYkZ10Gv6poR2b2d8XCug=";
            name = "editorconfig";
            publisher = "editorconfig";
            version = "0.17.2";
          }
          {
            hash = "sha256-pAkk3QURnlLNMZ2cFBks2lAEl/Hk8Z2i/QgvjUv+u2Y=";
            name = "errorlens";
            publisher = "usernamehw";
            version = "3.26.0";
          }
          {
            hash = "sha256-IbjWavQoXu4x4hpEkvkhqzbf/NhZpn8RFdKTAnRlCAg=";
            name = "even-better-toml";
            publisher = "tamasfe";
            version = "0.21.2";
          }
          {
            hash = "sha256-WTKVHrhBeAocP+stskFsSFtd0aR3u1TTEMYtdxj1tlY=";
            name = "gitignore";
            publisher = "codezombiech";
            version = "0.10.0";
          }
          {
            hash = "sha256-G5GKw+qkFrrX8FuycQyGvv8/5/AMXAxTsjeV6DMvRw4=";
            name = "gitlens";
            publisher = "eamodio";
            version = "2025.5.1305";
          }
          {
            hash = "sha256-R5SC6vMWT3alunlklJKcEKKJhNd6GI2MF9/QWwuNprs=";
            name = "go";
            publisher = "golang";
            version = "0.46.1";
          }
          {
            hash = "sha256-dOicya0B2sriTcDSdCyhtp0Mcx5b6TUaFKVb0YU3jUc=";
            name = "indent-rainbow";
            publisher = "oderwat";
            version = "8.3.1";
          }
          {
            hash = "sha256-ht6Wm1X7zien+fjMv864qP+Oz4M6X6f2RXjrThURr6c=";
            name = "javascriptsnippets";
            publisher = "xabikos";
            version = "1.8.0";
          }
          {
            hash = "sha256-E9UCSZe0hXnKwdNv6ua/Kzuy+wTFyeOGGVl7gFF4opY=";
            name = "material-icon-theme";
            publisher = "pkief";
            version = "5.22.0";
          }
          {
            hash = "sha256-mTvnUw/018p/1lJTje9rZ1JJXq4NiaI0d4UnRthnZtg=";
            name = "night-owl";
            publisher = "sdras";
            version = "2.1.1";
          }
          {
            hash = "sha256-MdFDOg9uTUzYtRW2Kk4L8V3T/87MRDy1HyXY9ikqDFY=";
            name = "nix-ide";
            publisher = "jnoortheen";
            version = "0.4.16";
          }
          {
            hash = "sha256-pNjkJhof19cuK0PsXJ/Q/Zb2H7eoIkfXJMLZJ4lDn7k=";
            name = "prettier-vscode";
            publisher = "esbenp";
            version = "11.0.0";
          }
          {
            hash = "sha256-OLi4gSjoz+TRgkb5UH1u6UTNfEF8ZgawrcXFDkoJtIc=";
            name = "remote-containers";
            publisher = "ms-vscode-remote";
            version = "0.413.0";
          }
          {
            hash = "sha256-Fj9cw+VJ2jkTGUclB1TLvURhzQsaryFQs/+f2RZOLHs=";
            name = "todo-tree";
            publisher = "gruntfuggly";
            version = "0.0.226";

          }
          {
            hash = "sha256-kHQuS6wxp3Gu5WSjWRXXMLwSrv7LBSsnsNu7VY4H/J0=";
            name = "vscode-docker";
            publisher = "ms-azuretools";
            version = "1.29.6";
          }
          {
            hash = "sha256-l5VvhQPxPaQsPhXUbFW2yGJjaqnNvijn4QkXPjf1WXo=";
            name = "vscode-eslint";
            publisher = "dbaeumer";
            version = "3.0.13";
          }
          {
            hash = "sha256-2zexyX1YKD5jgtsvDx7/z3luh5We71ys+XRlVcNywfs=";
            name = "vscodeintellicode";
            publisher = "visualstudioexptteam";
            version = "1.3.2";
          }
          {
            hash = "sha256-8xBD+WLBaxYt8v3+8lvV2SiqV89iE4jeQod2kH7LNHU=";
            name = "intellicode-api-usage-examples";
            publisher = "visualstudioexptteam";
            version = "0.2.9";
          }
          {
            hash = "sha256-mHKaWXSyDmsdQVzMqJI6ctNUwE/6bs1ZyeAEWKg9CV8=";
            name = "vscode-github-actions";
            publisher = "github";
            version = "0.27.1";
          }
          {
            hash = "sha256-8s1fuuTwUPd1Z32EqZNloD50KaFlPOxlvMmo5D6NaE4=";
            name = "vscode-kubernetes-tools";
            publisher = "ms-kubernetes-tools";
            version = "1.3.23";
          }
          {
            hash = "sha256-roD6ugBm04L2IOKIQiAWULhhq4wo1O9VMYiYtdwCrCc=";
            name = "vscode-pull-request-github";
            publisher = "github";
            version = "0.110.0";
          }
          {
            hash = "sha256-UtxDplORUWqmiW6I8n4ZhK7HAQdSDG4dw7M/cbjkmZY=";
            name = "vscode-yaml";
            publisher = "redhat";
            version = "1.18.0";
          }
        ];
      userSettings = {
        "editor.cursorBlinking" = "solid";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.minimap.enabled" = false;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "workbench.colorTheme" = "Night Owl (No Italics)";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "none";
        "redhat.telemetry.enabled" = false;
      };
    };
    # package = pkgs.vscodium;
  };
}
