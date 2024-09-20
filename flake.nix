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
        # devShells.default describes the default shell with C++, cmake, boost,
        # and catch2

        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              # C++ Compiler is already part of stdenv
              boost
              catch2
              cmake
            ];
          };

          # a shell that works on macOS 
          clang = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
            packages = with pkgs; [
              boost
              catch2
              cmake
            ];
          };
        };
      };
    };
}
