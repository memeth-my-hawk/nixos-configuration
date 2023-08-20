{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = rec {
    MOZ_ENABLE_WAYLAND = "1 firefox";
    QT_QPA_PLATFORM = "xcb zoom";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

}