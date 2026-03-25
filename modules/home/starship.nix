{
  configurations.home.modules.starship = {
    programs.starship = {
      enable = true;
      enableNushellIntegration = true;

      settings = {
        format = ''
          $cmake\
          $rust\
          $package\
          $cmd_duration\
          $git_branch\
          $git_commit\
          $git_state\
          $git_metrics
          $username$hostname$localip$sudo$directory$time
          $status$character
        '';

        character.format = "$symbol ";
        cmake.symbol = "CMake ";
        directory.repo_root_style = "bold yellow";
        git_commit.only_detached = false;

        git_state = {
          rebase = "🚧";
          merge = "⬇️";
          revert = "↩️";
          bisect = "🐞";
          am = "📬";
          am_or_rebase = "📬";
          cherry_pick = "🍒";
        };

        git_metrics.disabled = false;

        hostname = {
          ssh_only = false;
          format = "[$ssh_symbol$hostname]($style)@";
        };

        localip = {
          ssh_only = false;
          disabled = false;
          style = "bold fg:202";
        };

        status.disabled = false;
        sudo.disabled = false;
        username.show_always = true;
      };
    };
  };
}
