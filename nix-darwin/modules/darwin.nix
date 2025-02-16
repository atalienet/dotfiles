{ pkgs, ... }: {
    system = {
        defaults = {
            trackpad = {
                Clicking = true;
                TrackpadRightClick = true;
                TrackpadThreeFingerDrag = true;
            };
            dock = {
                autohide = true;
            };
            finder = {
                ShowPathbar = true;
                AppleShowAllExtensions = true;
                ShowHardDrivesOnDesktop = true;
            };
            CustomUserPreferences = {
                "com.apple.WindowManager".EnableTiledWindowMargins = 0;
                "com.apple.PowerChime".ChimeOnNoHardware = false;
            };
            NSGlobalDomain = {
                "com.apple.swipescrolldirection" = false;
            };
        };
    };
}