{
	description = "Impacket scripts with Python 3.12 environment using Nix flakes";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs }: 
	let
		system = "x86_64-linux";  # Adjust if on a different platform
		pkgs = import nixpkgs {
			inherit system;
		};
		impacketScripts = [
			"DumpNTLMInfo.py"
			"Get-GPPPassword.py"
			"GetADComputers.py"
			"GetADUsers.py"
			"GetLAPSPassword.py"
			"GetNPUsers.py"
			"GetUserSPNs.py"
			"addcomputer.py"
			"atexec.py"
			"changepasswd.py"
			"dacledit.py"
			"dcomexec.py"
			"describeTicket.py"
			"dpapi.py"
			"esentutl.py"
			"exchanger.py"
			"findDelegation.py"
			"getArch.py"
			"getPac.py"
			"getST.py"
			"getTGT.py"
			"goldenPac.py"
			"karmaSMB.py"
			"keylistattack.py"
			"kintercept.py"
			"lookupsid.py"
			"machine_role.py"
			"mimikatz.py"
			"mqtt_check.py"
			"mssqlclient.py"
			"mssqlinstance.py"
			"net.py"
			"netview.py"
			"ntfs-read.py"
			"ntlmrelayx.py"
			"owneredit.py"
			"ping.py"
			"ping6.py"
			"psexec.py"
			"raiseChild.py"
			"rbcd.py"
			"rdp_check.py"
			"reg.py"
			"registry-read.py"
			"rpcdump.py"
			"rpcmap.py"
			"sambaPipe.py"
			"samrdump.py"
			"secretsdump.py"
			"services.py"
			"smbclient.py"
			"smbexec.py"
			"smbserver.py"
			"sniff.py"
			"sniffer.py"
			"split.py"
			"ticketConverter.py"
			"ticketer.py"
			"tstool.py"
			"wmiexec.py"
			"wmipersist.py"
			"wmiquery.py"
		];
	in {
	devShells.${system}.default = pkgs.mkShell {
		buildInputs = with pkgs; [
			python312
			python312Packages.impacket
			python312Packages.charset-normalizer
			python312Packages.flask
			python312Packages.future
			python312Packages.ldap3
			python312Packages.ldapdomaindump
			python312Packages.pyasn1
			python312Packages.pycryptodome
			python312Packages.six
			python312Packages.setuptools
		];

		shellHook = ''
			echo "Impacket environment ready. Run Impacket scripts."
			echo "Use 'impacket-help' to list available Impacket scripts."

			# Define the impacket-help command
			impacket-help() {
			echo "Available Impacket scripts:"
			for script in ${builtins.concatStringsSep " " impacketScripts}; do
			echo "- $script"
			done
			}

			# Export the function to make it available in the shell
			export -f impacket-help
		'';
		};
	};
}
