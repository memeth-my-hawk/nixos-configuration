{ config, pkgs, lib, home-manager, ... }: {

  programs.waybar = {

    enable = true;

    package = pkgs.waybar.overrideAttrs (oldAttrs: {
         mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
       });

    style = ''

     * {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: "Source Code Pro Semibold", "Font Awesome 5 Free", "Font Awesome 6";
    font-size: 10px;
}

window#waybar {
    background-color: #f2f2f2;
    border-bottom: 0px solid rgba(100, 114, 125, 0.5);
    color: #000000;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

/*
window#waybar.empty {
    background-color: transparent;
}
window#waybar.solo {
    background-color: #FFFFFF;
}
*/


button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button {
    padding: 0 2px;
    background-color: #f2f2f2;
    color: #000000;
}

#workspaces button:hover {
	padding: 0 2px;
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.active {
	padding: 0 2px;
    background-color: #5294e2;
	color: #ffffff;
    /*box-shadow: inset 0 -3px #ffffff;*/
}

#workspaces button.focused {
	background-color: #5294e2;
	padding: 0 2px;
	color: #ffffff;
    /*box-shadow: inset 0 -3px #ffffff;*/

}

#workspaces button.unfocused {
    background-color: #f2f2f2;
	padding: 0 2px;
	color: #000000;
    /*box-shadow: inset 0 -3px #ffffff;*/
}


#workspaces button.urgent {
	padding: 0 2px;
    background-color: #eb4d4b;
}

#mode {
	padding: 0 2px;
    background-color: #eb4d4b;
    /*#border-bottom: 3px solid #ffffff;*/
}

#clock,
#battery,
#pulseaudio,
#wireplumber,
#tray,
#idle_inhibitor,
#window,
#custom/power,
#custom/launcher,

#custom-power{
    background-image: linear-gradient(to left, #000000 0%, #000000  51%, #434343  100%);
    font-size: 20px;
    margin-right: 5px;

}

#custom-launcher{
    background-image: linear-gradient(to right, #000000 0%, #000000  51%, #434343  100%);
    font-size: 20px;
    margin-left: 5px;
}


#workspaces {
    margin: 0 2px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
	padding: 0 4px;
	color: #000000;
    /*background-color: #64727D;*/
}

#battery {
	padding: 0 4px;
    /*background-color: #cc3399;*/
    color: #000000;
}

#battery.charging, #battery.plugged {
	padding: 0 4px;
    color: #ffffff;
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#battery.critical:not(.charging) {
	padding: 0 4px;
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
	padding: 0 4px;
    background-color: #000000;
}



#pulseaudio {
	padding: 0 4px;
    /*background-color: #f1c40f;*/
    color: #000000;
}

#pulseaudio.muted {
	padding: 0 4px;
    /*background-color: #90b1b1;*/
    color: #000000;
}

#wireplumber {
	padding: 0 4px;
    /*background-color: #fff0f5;*/
    color: #000000;
}

#wireplumber.muted {
	padding: 0 4px;
    /*background-color: #f53c3c;*/
	color: #000000
}

#tray {
	padding: 0 4px;
	color: #000000;
    /*background-color: #ffffff;*/
}

#tray > .passive {
	padding: 0 4px;
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
	padding: 0 4px;
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

#idle_inhibitor {
	padding: 0 4px;
    /*background-color: #ecf0f1;*/
	color: #000000;
}

#idle_inhibitor.activated {
	padding: 0 4px;
    background-color: #2d3436;
    color: #ffffff;
}

#keyboard-state {
	padding: 0 4px;
    /*background: #97e1ad;*/
    color: #000000;
    /*margin: 0 2px;*/
    min-width: 10px;
}

#keyboard-state > label {
    padding: 0 4px;
}

#keyboard-state > label.locked {
	padding: 0 4px;
    background: rgba(0, 0, 0, 0.2);
}

   
    '';

    settings = {

      mainBar = {

        layer = "top";
        position = "bottom";
        height = 35;
        spacing = 4;
        margin-top = 0;
        margin-bottom = 0;

        modules-left = [  "custom/launcher" "wlr/taskbar"];
        modules-right = [ "idle_inhibitor" "battery" "pulseaudio" "keyboard-state" "clock" "tray" "custom/power"];

        "wlr/taskbar" =  {
          format = "{icon}";
          icon-size = 20;
          #icon-theme = "Star";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          on-click-right = "minimize";
        };

        keyboard-state = {
          numlock = true;
          capslock = true;
          format = " {name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        tray = {
          icon-size = 20;
          spacing = 10;
        };
        
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        battery = {
          states = {
              good = 95;
              warning = 30;
              critical = 15;
          };
          format = "{icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["", "", "", "", ""];
          interval = 2;
        };


        pulseaudio = {
          scroll-step = 1;
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["", "", ""];
          };
        };

        "custom/launcher" = {
          format = "";
          on-click = "wofi --show drun";
          on-click-right = "killall wofi";
        };

        "custom/power" = {
          format = " ";
          on-click = "wlogout";
          on-click-right = "killall wlogout";
        };
      
      };

    };

  };

}
