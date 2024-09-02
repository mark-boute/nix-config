{ config, lib, pkgs, inputs, ... }:
{ 
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    configure = {
      customRC = lib.fileContents ./init.vim;

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ 
          ctrlp
          nvim-tree-lua
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };
}