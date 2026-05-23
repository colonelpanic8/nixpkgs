{
  lib,
  fetchFromGitHub,
  gamescope,
}:

gamescope.overrideAttrs (
  finalAttrs: previousAttrs: {
    pname = "gamescope-kbm";
    version = "0-unstable-2026-03-11";

    src = fetchFromGitHub {
      owner = "partydeck";
      repo = "gamescope";
      rev = "074c4f6f6f07d473af995717cc647e43efef741c";
      fetchSubmodules = true;
      hash = "sha256-MrI5Q6qS+dyWdjxNdYYDOq5HmTCBT8HDjhxmMpBeWNU=";
    };

    mesonFlags = previousAttrs.mesonFlags ++ [
      (lib.mesonOption "benchmark" "disabled")
      (lib.mesonOption "input_emulation" "disabled")
    ];

    postInstall = ''
      mv $out/bin/gamescope $out/bin/gamescope-kbm
    ''
    +
      builtins.replaceStrings [ "$out/bin/gamescope" ] [ "$out/bin/gamescope-kbm" ]
        previousAttrs.postInstall;

    passthru = { };

    meta = previousAttrs.meta // {
      description = "Gamescope fork with keyboard and mouse device filtering support";
      homepage = "https://github.com/partydeck/gamescope";
      mainProgram = "gamescope-kbm";
      maintainers = [ lib.maintainers.imalison ];
    };
  }
)
