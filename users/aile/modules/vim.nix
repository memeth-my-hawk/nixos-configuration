{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace ];
        #opt = [];
      };
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
        set laststatus=2
        set statusline=
          set statusline +=%1*\ %n\ %*            "buffer number
          set statusline +=%5*%{&ff}%*            "file format
          set statusline +=%3*%y%*                "file type
          set statusline +=%4*\ %<%F%*            "full path
          set statusline +=%2*%m%*                "modified flag
          set statusline +=%1*%=%5l%*             "current line
          set statusline +=%2*/%L%*               "total lines
          set statusline +=%1*%4v\ %*             "virtual column number
          set statusline +=%2*0x%04B\ %*          "character under cursor
      '';
    }
  )];
}

