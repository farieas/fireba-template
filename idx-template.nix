{ pkgs, sample ? "none", template ? "app", platforms ? "android,ios,web", statemanagement ? "bloc", ... }:
{
  channel = "unstable";
  packages = [
    pkgs.git
    pkgs.curl
    pkgs.gnutar
    pkgs.xz
    pkgs.flutter
    pkgs.jdk21
  ];
  
  bootstrap = ''
    echo "Waiting for Firebase Studio environment..."
    sleep 2

    echo "Creating Flutter project using Firebase Studio Flutter version..."
    flutter create "$out" --platforms="${platforms}" --template="${template}"

    mkdir -p "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    install --mode u+rw ${./dev.nix} "$out"/.idx/dev.nix
    chmod -R u+w "$out"

  '';
}
