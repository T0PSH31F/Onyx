let
  iCloudMailSettings = {
    imap = {
      host = "imap.mail.me.com";
      port = 993;
    };
    smtp = {
      host = "smtp.mail.me.com";
      port = 587;
      tls.useStartTls = true;
    };
  };
  GmailSettings = {
    imap = {
      host = "imap.gmail.com";
      port = 993;
    };
    smtp = {
      host = "smtp.gmail.com";
      port = 465;
      # tls.useStartTls = true;
    };
  };
in
{
  imports = [
    ./himalaya.nix
    ./thunderbird.nix
  ];
  accounts.email.accounts = {
    "wrighterik77@gmail.com" = GmailSettings // {
      realName = "Erik Wright";
      address = "wrighterik77@gmail.com";
      userName = "wrighterik77@gmail.com";
      passwordCommand = "";
    };
  };
}
