# Platform-independent terminal setup
{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
in
{
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];
  home.packages = with pkgs; [
    # Unixy tools
    ripgrep
    fd
    sd
    wget
    moreutils # ts, etc.
    gnumake
    killall
    # Broken, https://github.com/NixOS/nixpkgs/issues/299680
    # ncdu

    # Useful for Nix development
    ci
    omnix
    nixpkgs-fmt
    just

    # Publishing
    asciinema
    ispell
    pandoc

    # Dev
    gh
        
    # Fonts
    cascadia-code
    monaspace

    # Txns
    hledger
    hledger-web
    gnupg
  ];

  fonts.fontconfig.enable = true;

  home.shellAliases = {
    e = "nvim";
    g = "git";
    lg = "lazygit";
    l = "ls";
    beep = "say 'beep'";
  };

  programs = {
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    nix-index-database.comma.enable = true;
    lsd = {
      enable = true;
      enableAliases = true;
    };
    bat.enable = true;
    autojump.enable = false;
    zoxide.enable = true;
    fzf.enable = true;
    jq.enable = true;
    btop.enable = true;
  };
}
