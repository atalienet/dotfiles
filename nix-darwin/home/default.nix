{ identifiers, config, pkgs, lib, ... }:
{
  users.users."${identifiers.username}" = {
    name = "${identifiers.username}";
    home = "/Users/${identifiers.username}";
  };

  home-manager.users."${identifiers.username}" = {
    home.stateVersion = "24.11";
    home.username = "${identifiers.username}";
    home.homeDirectory = "/Users/${identifiers.username}";
    programs = {
      home-manager.enable = true;
    };
    programs.zsh = {
      enable = true;
      initExtra = ''
        export GPG_TTY=$(tty)
        export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      '';
    };
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = true;
            format = lib.concatStrings [
            "$os"
            "$directory"
            "$git_branch"
            "$git_commit"
            "$git_status"
            "$hostname"
            "$cmd_duration"
            "$character"
            ];
            right_format = "$nix_shell";
            character = {
              success_symbol = "[❯](bold green)";
              error_symbol = "[❯](bold red)";
              vicmd_symbol = "[❮](bold green)";
            };
            cmd_duration = {
              min_time = 5000;
              show_notifications = if pkgs.stdenv.isLinux then false else true;
              min_time_to_notify = 30000;
              format = "[$duration]($style) ";
            };
            os = {
              format = "[$symbol$arch]($style) ";
              symbols = {
                  Macos = "";
                  Windows = "🖥";
                  Unknown = "🐧";
                  };
              disabled = false;
            };
            directory = {
              truncate_to_repo = true;
              truncation_length = 100;
            };
            git_branch = {
              format = "[$symbol$branch]($style)";
            };
            git_commit = {
              format = "( @ [$hash]($style) )";
              only_detached = false;
            };
            git_status = {
              format = "([$all_status$ahead_behind]($style) )";
              conflicted = "=";
              ahead = "⇡";
              behind = "⇣";
              diverged = "⇕";
              untracked = "⋄";
              stashed = "⩮";
              modified = "∽";
              staged = "+";
              renamed = "»";
              deleted = "✘";
              style = "purple";
            };
            hostname = {
              ssh_only = true;
              format = "on [$hostname](bold red) ";
            };
            nix_shell = {
              format = "[$symbol $name]($style)";
              symbol = "❄️";
            };
        };
      };
  };
}
