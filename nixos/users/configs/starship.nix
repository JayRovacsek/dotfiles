{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      directory.read_only = "🔒";
      aws.disabled = true;

      username = {
        show_always = true;
        format = "[$user]($style) in ";
      };

      hostname = {
        ssh_only = false;
        disabled = false;
      };

      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };
}