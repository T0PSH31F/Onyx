{ ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = {
    git = {
      enable = true;
      userName = "t0psh31f";
      userEmail = "wrighterik77@gmail.com";
      ignores = [ "*~" "*.swp" ];
      aliases = {
        ci = "commit";
      };
      extraConfig = {
          init.defaultBranch = "master";
        # pull.rebase = "false";
      };
    };
    lazygit.enable = true;
  };

}
