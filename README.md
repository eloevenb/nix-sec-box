# nix-sec-box
Contains a set of nix flakes with pentesting tools

## Usage
In one of the flakes/xx directory, to generate a flake.lock file, so that the packages don't get updated every time, run :  
```
nix flake update
```  
Then run :  
```
nix develop
```