{
    description = "Flake for mystugh package management";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs, ... } @ inputs: 
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        devShells.${system}.default = 
            import ./nix/dependencies.nix { inherit pkgs; };

        packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

        packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    };
}
