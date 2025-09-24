# No user-configurable parameters
{ pkgs, ... }: {
  # Shell script that produces the final environment
  bootstrap = ''
    # Copy the folder containing the `idx-template` files to the final
    # project folder for the new workspace. ${./.} inserts the directory
    # of the checked-out Git folder containing this template.
    cp -rf ${./.} "$out"

    # Set some permissions
    chmod -R u+w "$out"

    # Create .dev directory and copy dev.nix to it
    mkdir -p "$out/.idx"
    cp ${./dev.nix} "$out"/.idx/dev.nix

    # Remove the template files themselves and any connection to the template's
    # Git repository
    rm -rf "$out/.git" "./dev.nix" "$out/idx-template".{nix,json}
  '';
}
