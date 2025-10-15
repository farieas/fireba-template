{ pkgs, ... }: {
  packages = [
   
  ];
  bootstrap = ''
    mkdir -p "$WS_NAME"
    mkdir "$WS_NAME/.idx/"
    chmod -R +w "$WS_NAME"
    cp ${./dev.nix} "$WS_NAME"/.idx/dev.nix
    mv "$WS_NAME" "$out"
    echo "flutter app $HOME/myapp"
    mkdir -p "$out/.idx"
    chmod -R u+w "$out"
  '';
}
