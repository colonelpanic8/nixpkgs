{ lib, stdenv, kernel, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  pname = "soundwire-dkms";
  version = "2020-07-04";

  src = fetchFromGitHub {
    owner = "IvanMalison";
    repo = "soundwire-dkms";
    rev = "fb5d88d3ddd97a61c0191258c36e3404f38f5b46";
    sha256 = "sha256-+JyF4e/Tz1ym1s91OmQcIAGnDmqbNOG0na+aVx7LQOQ=";
  };

  buildPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build \
      -j$NIX_BUILD_CORES M=$(pwd) modules
  '';

  installPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build INSTALL_MOD_PATH=$out M=$(pwd) modules_install
  '';
}
