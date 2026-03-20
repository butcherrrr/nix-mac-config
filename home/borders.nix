{ ... }:

{
  home.file.".config/borders/bordersrc" = {
    text = ''
      #!/bin/bash

      options=(
      	width=2.0
      	hidpi=on
      	active_color=0xffffffff
      )

      borders "''${options[@]}"
    '';
    executable = true;
  };
}
