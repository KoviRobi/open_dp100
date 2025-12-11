{
  pkgs ? import <nixpkgs> { },
  version ? "v0.0.1-unknown",
}:
let
  inherit pkgs;
in
pkgs.rustPlatform.buildRustPackage {
  pname = "open_dp100";
  inherit version;
  src = pkgs.lib.sourceByRegex ./. [
    "Cargo\.lock"
    "Cargo\.toml"
    "src"
    "src/bin"
    ".*\.rs$"
    "alientek-dp100\.rules"
  ];

  nativeBuildInputs = [
    pkgs.pkg-config
  ];
  buildInputs = [
    pkgs.udev
  ];

  cargoLock.lockFile = ./Cargo.lock;

  postInstall = ''
    mkdir -p "$out/etc/udev/rules.d"
    cp alientek-dp100.rules "$out/etc/udev/rules.d"
  '';

  meta = {
    description = "Control Alientek DP100 from command line";
    mainProgram = "deploy";
  };
}
