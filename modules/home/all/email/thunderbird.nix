{ pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;

    profiles."default" = {
      isDefault = true;
    };
  };

  accounts.email.accounts = {
    "wrighterik77@gmail.com".thunderbird = {
      enable = true;
    };
  };
}
