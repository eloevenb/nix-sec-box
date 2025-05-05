{
  description = "Network security shell using Nix flakes";

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
            arp-scan
			arp-scan-rs
			arping
			arpoison
			atftp
			bandwhich
			bngblaster
			cdncheck
			evillimiter
			iperf2
			iputils
			lftp
			mitm6
			mtr
			ncftp
			netcat-gnu
			netdiscover
			netexec
			nload
			nmap
			nuttcp
			putty
			pwnat
			responder
			route-graph
			rustcat
			sshping
			sslh
			tunnelgraf
			wbox
			whois
			yersinia
          ];

          shellHook = ''
            echo "Network flake environment ready"
          '';
        };
      };
    };
  };
}

