{
  description = "Password shell using Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells = {
		x86_64-linux = let
		pkgs = import nixpkgs {
			system = "x86_64-linux";
			config = {
				allowUnfree = true;
			};
		};
		in {
			default = pkgs.mkShell {
				packages = with pkgs; [
					authoscope
					bruteforce-luks
					brutespray
					conpass
					crunch
					h8mail
					hashcat
					hashcat-utils
					hashdeep
					john
					legba
					medusa
					nasty
					nth
					phrasendrescher
					thc-hydra
					truecrack
				];

				shellHook = ''
					echo "Password flake environment ready"
				'';
			};
		};
    };
  };
}

