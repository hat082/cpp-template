{
  description = "C++ Dev with Nix";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              gcc
              boost
              catch2
              cmake
              # raylib
            ]; 
            shellHook = ''
              # export CPATH=${pkgs.raylib}/include:$CPATH
              # export LIBRARY_PATH=${pkgs.raylib}/lib:$LIBRARY_PATH
              export CPATH=${pkgs.gcc}/include:$CPATH   # Add the GCC include paths
              export LIBRARY_PATH=${pkgs.gcc}/lib:$LIBRARY_PATH   # Add GCC lib paths
            '';
          };
        };
      };
    };
}
