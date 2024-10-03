{ lib, config, pkgs, ... }:
{

  programs.kate = {
    enable = true;
    package = pkgs.kdePackages.kate;
    editor = {
      brackets = {
        automaticallyAddClosing = true;
        characters = "<>(){}[]'\"`*_~";
        flashMatching = true;
        highlightMatching = true;
        highlightRangeBetween = true;
      };
      font = {
        family = "Source Code Pro";
        pointSize = 10;
      };
      indent = {
        autodetect = true;
        showLines = true;
      };
      inputMode = "vi";

    };
  };

}
