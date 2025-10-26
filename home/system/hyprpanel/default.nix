# Hyprpanel is the bar on top of the screen
# Display information like workspaces, battery, wifi, ...
{
  config,
  lib,
  ...
}: let
  inherit (config.theme.bar) transparentButtons floating transparent position;
  inherit (config.theme) rounding border-size gaps-out gaps-in;
  inherit (config.var) location;

  font = "${config.stylix.fonts.serif.name}";
  fontSizeForHyprpanel = "${toString config.stylix.fonts.sizes.desktop}px";

  homeDir = "/home/${config.var.username}";
in {
  wayland.windowManager.hyprland.settings.exec-once = ["hyprpanel"];

  programs.hyprpanel = {
    enable = true;

    settings = {
      # Bar layouts
      bar.layouts = {
        "*" = {
          left = ["dashboard" "workspaces" "windowtitle"];
          middle = ["media"];
          right = [
            "systray"
            "volume"
            "clock"
            "notifications"
          ];
        };
      };

      # Bar configuration
      bar = {
        launcher.icon = "";

        workspaces = {
          show_numbered = true;
          workspaces = 6;
          numbered_active_indicator = "color";
          monitorSpecific = true;
          applicationIconEmptyWorkspace = "";
          showApplicationIcons = false;
          showWsIcons = true;
        };

        windowtitle.label = true;
        volume.label = false;
        network.truncation_size = 12;
        bluetooth.label = false;
        clock.format = "%a %b %d  %I:%M %p";
        notifications.show_total = true;
        media.show_active_only = true;

        customModules = {
          updates.pollingInterval = 1440000;
          cava = {
            showIcon = false;
            stereo = true;
            showActiveOnly = true;
          };
        };
      };

      # Notifications configuration
      notifications = {
        position = "top right";
        showActionsOnHover = true;
      };

      # Menus configuration
      menus = {
        clock.weather = {
          inherit location;
          unit = "metric";
        };

        dashboard = {
          powermenu = {
            confirmation = false;
            avatar.image = "~/.face.icon";
          };

          shortcuts = {
            left = {
              shortcut1 = {
                icon = "";
                command = "zen";
                tooltip = "Zen";
              };
              shortcut2 = {
                icon = "󰅶";
                command = "caffeine";
                tooltip = "Caffeine";
              };
              shortcut3 = {
                icon = "󰖔";
                command = "night-shift";
                tooltip = "Night-shift";
              };
              shortcut4 = {
                icon = "";
                command = "menu";
                tooltip = "Search Apps";
              };
            };

            right = {
              shortcut1 = {
                icon = "";
                command = "hyprpicker -a";
                tooltip = "Color Picker";
              };
              shortcut3 = {
                icon = "󰄀";
                command = "screenshot region swappy";
                tooltip = "Screenshot";
              };
            };
          };

          directories = {
            left = {
              directory1 = {
                label = "     Home";
                command = "xdg-open ${homeDir}";
              };
              directory2 = {
                label = "󰲂     Documents";
                command = "xdg-open ${homeDir}/Documents";
              };
              directory3 = {
                label = "󰉍     Downloads";
                command = "xdg-open ${homeDir}/Downloads";
              };
            };

            right = {
              directory1 = {
                label = "     Desktop";
                command = "xdg-open ${homeDir}/Desktop";
              };
              directory2 = {
                label = "     Videos";
                command = "xdg-open ${homeDir}/Videos";
              };
              directory3 = {
                label = "󰉏     Pictures";
                command = "xdg-open ${homeDir}/Pictures";
              };
            };
          };
        };
      };

      # Wallpaper
      wallpaper.enable = false;

      # Theme configuration - structural/layout only, no colors
      theme = lib.mkForce {
        font = {
          name = font;
          size = fontSizeForHyprpanel;
        };

        bar = {
          outer_spacing =
            if floating && transparent
            then "0px"
            else "8px";
          inherit floating transparent;
          location = position;
          dropdownGap = "4.5em";

          margin_top =
            (
              if position == "top"
              then toString (gaps-in * 2)
              else "0"
            )
            + "px";
          margin_bottom =
            (
              if position == "top"
              then "0"
              else toString (gaps-in * 2)
            )
            + "px";
          margin_sides = toString gaps-out + "px";
          border_radius = toString rounding + "px";

          buttons = {
            y_margins =
              if floating && transparent
              then "0px"
              else "8px";
            spacing = "0.3em";
            radius =
              (
                if transparent
                then toString rounding
                else toString (rounding - 8)
              )
              + "px";
            padding_x = "0.8rem";
            padding_y = "0.4rem";
            style = "default";
            monochrome = true;
          };

          menus = {
            shadow =
              if transparent
              then "0 0 0 0"
              else "0px 0px 3px 1px #16161e";
            monochrome = true;
            card_radius = toString rounding + "px";

            border = {
              size = toString border-size + "px";
              radius = toString rounding + "px";
            };

            menu.media.card.tint = 90;
          };
        };

        notification = {
          opacity = 90;
          enableShadow = true;
          border_radius = toString rounding + "px";
        };

        osd = {
          enable = true;
          orientation = "vertical";
          location = "left";
          radius = toString rounding + "px";
          margins = "0px 0px 0px 10px";
          muted_zero = true;
        };
      };
    };
  };
}
