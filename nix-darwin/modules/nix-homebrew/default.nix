{ identifiers, homebrew-core, homebrew-cask, homebrew-bundle, homebrew-nikitabobko, ... }:{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "${identifiers.username}";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
      "nikitabobko/homebrew-aerospace" = homebrew-nikitabobko;
    };
    mutableTaps = false;
  };
}