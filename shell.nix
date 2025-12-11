let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  name = "open_dp100-env";
  packages = [
    pkgs.cargo
    pkgs.pkg-config
    pkgs.udev
    pkgs.rustfmt
  ];
}
