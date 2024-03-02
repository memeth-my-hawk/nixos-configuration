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
    color: #ffffff;
    /*#border-bottom: 3px solid #ffffff;*/
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network, 
#pulseaudio,
#wireplumber,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#window,
#workspaces {
    margin: 0 3px;
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
	padding: 0 2px;
	color: #000000;
    /*background-color: #64727D;*/
}

#battery {
	padding: 0 2px;
    /*background-color: #cc3399;*/
    color: #000000;
}
      
#battery.charging { 
	padding: 0 2px;
    color: #ffffff;
    background-color: #26A65B;
}

#battery.plugged {
	padding: 0 2px;
    color: #ffffff;
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#battery.warning:not(.charging) {
	padding: 0 2px;
    background-color: #dee822;
    color: #000000;
}


#battery.critical:not(.charging) {
	padding: 0 2px;
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
	padding: 0 2px;
    background-color: #000000;
}

#cpu {
	padding: 0 2px;
    /*background-color: #2ecc71;*/
    color: #000000;
}

#memory {
	padding: 0 2px;
    /*background-color: #9b59b6;*/
	color: #000000;
}

#disk {
	padding: 0 2px;
    /*background-color: #964B00;*/
	color: #000000;
}

#backlight {
	padding: 0 2px;
    /*background-color: #90b1b1;*/
	color: #000000;
}

#network {
	padding: 0 2px;
	color: #000000;
    /*background-color: #ffffff;*/
}

#network.disconnected {
	padding: 0 2px;
	color: #ffffff;
    background-color: #f53c3c;
}

#pulseaudio {
	padding: 0 2px;
    /*background-color: #f1c40f;*/
    color: #000000;
}

#pulseaudio.muted {
	padding: 0 2px;
    /*background-color: #90b1b1;*/
    color: #000000;
}

#wireplumber {
	padding: 0 2px;
    /*background-color: #fff0f5;*/
    color: #000000;
}

#wireplumber.muted {
	padding: 0 2px;
    /*background-color: #f53c3c;*/
	color: #000000
}


#temperature {
	padding: 0 2px;
    /*background-color: #f0932b;*/
	color: #000000;
}

#temperature.critical {
	padding: 0 2px;
    background-color: #eb4d4b;
}

#tray {
	padding: 0 2px;
	color: #000000;
    /*background-color: #ffffff;*/
}

#tray > .passive {
	padding: 0 2px;
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
	padding: 0 2px;
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

#idle_inhibitor {
	padding: 0 2px;
    /*background-color: #ecf0f1;*/
	color: #000000;
}

#idle_inhibitor.activated {
	padding: 0 2px;
    background-color: #2d3436;
    color: #ffffff;
}


#keyboard-state {
	padding: 0 2px;
    /*background: #97e1ad;*/
    color: #000000;
    /*margin: 0 2px;*/
    min-width: 10px;
}

#keyboard-state > label {
    padding: 0 2px;
}

#keyboard-state > label.locked {
	padding: 0 2px;
    background: rgba(0, 0, 0, 0.2);
}

#scratchpad {
	padding: 0 2px;
    background: rgba(0, 0, 0, 0.2);
    color: #ffffff;
}

#scratchpad.empty {
	background-color: transparent;
}
      
       '';

    settings = {

      mainBar = {

        layer = "top";
        position = "top";
        height = 15;
        spacing = 2;

        modules-left = ["sway/workspaces" "sway/scratchpad" "sway/mode" "sway/window"];
        modules-right = ["idle_inhibitor" "pulseaudio" "cpu" "temperature" "disk" "memory" "keyboard-state" "battery" "clock" "tray"];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        disk = {
  	      interval = 5;
  	      format = " {percentage_used}%";
        };


        "sway/scratchpad" = {
            format = "{icon}{count}";
            show-empty = false;
            format-icons = ["" ""];
            tooltip = true;
            tooltip-format = "{app}: {title}";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          icon-size = 18;
          spacing = 4;
        };

        clock = {
          tooltip-format = "<big>{:%H:%M:%S}</big>\n<tt><big>{calendar}</big></tt>";
          format = "{:%H:%M:%S}";
          format-alt = "{:%d/%m/%Y}";
          interval = 5;
        };

        cpu = {
          format = " {usage}%";
          tooltip = false;
          interval = 5;
        };

        memory = {
          format = " {}%";
          interval = 5;
        };

        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/thermal/thermal_zone4/temp";
          critical-threshold = 80;
          format-critical = "{icon} {temperatureC}°C";
          format = "{icon} {temperatureC}°C";
          interval = 5;
          format-icons = ["" "" ""];
        };

        backlight = {
          device = "acpi_video1";
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            good = 90;
            warning = 30;
            critical = 20;
          };
          interval = 2;
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };

        network = {
          format-wifi = " {essid}({signalStrength}%)";
          format-ethernet = " {ipaddr}/{cidr}";
          tooltip-format = " {ifname} via {gwaddr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          interval = 2;
        };

        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}%{icon} {format_source}";
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
            default = ["" "" ""];
          };
        };
      
      };

    };

  };

}
