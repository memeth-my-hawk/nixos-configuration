{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      #vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
      #  start = [ vim-nix vim-lastplace ];
      #  opt = [];
      #};
      vimrcConfig.customRC = ''
        syntax enable
        set nocompatible
        set backspace=indent,eol,start
        syntax on
        filetype on
        filetype plugin on
        filetype indent on
        set number
        set tabstop=4
        set incsearch
        set ignorecase
        set smartcase
        set showcmd
        set showmatch
        set hlsearch
        set history=1000
        set wildmenu
        set wildmode=list:longest
        set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
      '';
    }
  )];
}

