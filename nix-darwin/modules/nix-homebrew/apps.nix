{pkgs, ...}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
    };
    casks = [
      "xcodes"
      "coconutbattery"
      "keyclu"
      "wezterm"
      "ghostty"
      "rio"
      "1password-cli"
    ];
  };
}