# nix-sec-box
A set of nix flakes with pentesting tools, contains [danielmiessler's SecLists](https://github.com/danielmiessler/SecLists) (very useful wordlists).

## Usage
In one of the flakes/xx directory, to generate a flake.lock file, so that the packages don't get updated every time, run :  
```
nix flake update
```  
Then run :  
```
nix develop
```
