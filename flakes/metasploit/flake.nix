{
  description = "Metasploit dev shell using Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux = let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            metasploit
            ruby
            bundler
            rubyPackages.rake
            libffi
            libyaml
            openssl
            zlib
            pkg-config
            gnumake
            gcc
          ];

          shellHook = ''
            echo "Metasploit flake environment ready. Run 'msfconsole'."
            export GEM_HOME=$PWD/.gems
            export GEM_PATH=$GEM_HOME
            export PATH=$GEM_HOME/bin:$PATH
          '';
        };
      };
    };
  };
}

