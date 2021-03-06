# This file was generated by https://github.com/kamilchm/go2nix v1.2.1
{ lib, stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "kustomize-${version}";
  version = "1.0.8";
  # rev is the 1.0.8 commit, mainly for kustomize version command output
  rev = "58492e2d83c59ed63881311f46ad6251f77dabc3";

  goPackagePath = "sigs.k8s.io/kustomize";

  buildFlagsArray = let t = "${goPackagePath}/pkg/commands"; in ''
    -ldflags=
      -s -X ${t}.kustomizeVersion=${version}
         -X ${t}.gitCommit=${rev}
         -X ${t}.buildDate=unknow
  '';

  src = fetchFromGitHub {
    sha256 = "0y6dqwhm7lczjy0zk2fnc1i43lvnjhcvihvm7qknky05z9f0v8bx";
    rev = "v${version}";
    repo = "kustomize";
    owner = "kubernetes-sigs";
  };

  meta = with lib; {
    description = "Customization of kubernetes YAML configurations";
    longDescription = ''
      kustomize lets you customize raw, template-free YAML files for
      multiple purposes, leaving the original YAML untouched and usable
      as is.
    '';
    homepage = https://github.com/kubernetes-sigs/kustomize;
    license = licenses.asl20;
    maintainers = [ maintainers.carlosdagos maintainers.vdemeester ];
  };
}
