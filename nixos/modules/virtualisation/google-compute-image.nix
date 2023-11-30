{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.virtualisation.googleComputeImage;
  defaultConfigFile = pkgs.writeText "configuration.nix" ''
        { pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/google-compute-image.nix>
  ];
  users.users = {
    railbird_develop_gmail_com = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUSkj7587e+MAUNyU/KRpw9Vk++53Wv5nB+0V1QgiTO3rMQe6HJt0Tm2wi/o/T8GNjueT2D69YgkqOIF1FQwsj2EFLObcMzeBgs5gTSglqggA2I91BIc1vvgjCDpogOMAzAQGlTxRnqrEXhqG0jJtw8KIzLr9WrvWLdTT4rHtWS8RoOBgkQ8oxbggZ4vtbMBIwoIAYGRr70KBRNCsLTPLa8yEf+DDQxq1entzxSjHXHgyeBSVVpPCrBVmhjandk+lIFInjvAiAE1ZkJHSRccL73ORmgb1crwH7xlD9NwBPmypowMi8UIRMKfL2lNehT0AQIlEAikUBLMDzPIPhnwLZ imalison@ivanm-dfinity-razer.local"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHEsLV27EteTsuVl1gLAZRCklpMFBMhakKbQ2+MkN5rm JuiceSSH"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICzGkqGJm+nrMvsrfuWOLVxXHvi0UL1ULJmyfzS9sKpy imalison@biskcomp"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuO/tc728fKyctlufiehZQuKsD0XDiS/5x7TImk0Ip4 imalison@ivanm-dfinity-razer"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDt/rcYuGGlXBcRUJvzUCgOW8PNVkJJ5TwEOha1/KGM4 imalison@stevie-nixos"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICzGkqGJm+nrMvsrfuWOLVxXHvi0UL1ULJmyfzS9sKpy imalison@biskcomp"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJr9kVlYIZIPXfXom4Fi7S2yvp5sWJ6BSM5m3uLh+8y5 imalison@adele"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOFkA5JZkq8mRd7St0jP2P6WyYYhW2CChmQoY20N45f imalison@ryzen-shine"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJ7S93cC2gsu/JbnDsa6X1omJzn1mI6ppKd2k+yV4aD imalison@jimi-hendnix"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIiZd2FiyTJvuvDh5hH0L3BqZV3E/kwwyau57QD7pz7C cardno:000614590850" # Dfinity Admin
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHOEt0T+Hxxat5tbkD9mSu8T271QjRrLr2EA0rIDXUNL cardno:000614590748" # Dfinity Read-Only
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCJ08qswd3OoApAIHQwojEUJ4sre89vSngbM3x5pBP2 imalison@jay-lenovo.local" # Kat's Lenovo Legion
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOVGIGnpkU7HNQ/zl/Ffi562M+laWY9/yIjB63BCMiTS kat@nixcomp.local"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3tlMePru6ZlSuf8yUii3N1dy3WwJnSQAt3EgETkctK kat@jay-lenovo.local"
        ]
      ];
      group = "users";
      isNormalUser = true;
      createHome = true;
      shell = pkgs.zsh;
    };
    imalison = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUSkj7587e+MAUNyU/KRpw9Vk++53Wv5nB+0V1QgiTO3rMQe6HJt0Tm2wi/o/T8GNjueT2D69YgkqOIF1FQwsj2EFLObcMzeBgs5gTSglqggA2I91BIc1vvgjCDpogOMAzAQGlTxRnqrEXhqG0jJtw8KIzLr9WrvWLdTT4rHtWS8RoOBgkQ8oxbggZ4vtbMBIwoIAYGRr70KBRNCsLTPLa8yEf+DDQxq1entzxSjHXHgyeBSVVpPCrBVmhjandk+lIFInjvAiAE1ZkJHSRccL73ORmgb1crwH7xlD9NwBPmypowMi8UIRMKfL2lNehT0AQIlEAikUBLMDzPIPhnwLZ imalison@ivanm-dfinity-razer.local"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHEsLV27EteTsuVl1gLAZRCklpMFBMhakKbQ2+MkN5rm JuiceSSH"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICzGkqGJm+nrMvsrfuWOLVxXHvi0UL1ULJmyfzS9sKpy imalison@biskcomp"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuO/tc728fKyctlufiehZQuKsD0XDiS/5x7TImk0Ip4 imalison@ivanm-dfinity-razer"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDt/rcYuGGlXBcRUJvzUCgOW8PNVkJJ5TwEOha1/KGM4 imalison@stevie-nixos"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICzGkqGJm+nrMvsrfuWOLVxXHvi0UL1ULJmyfzS9sKpy imalison@biskcomp"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJr9kVlYIZIPXfXom4Fi7S2yvp5sWJ6BSM5m3uLh+8y5 imalison@adele"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOFkA5JZkq8mRd7St0jP2P6WyYYhW2CChmQoY20N45f imalison@ryzen-shine"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJ7S93cC2gsu/JbnDsa6X1omJzn1mI6ppKd2k+yV4aD imalison@jimi-hendnix"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIiZd2FiyTJvuvDh5hH0L3BqZV3E/kwwyau57QD7pz7C cardno:000614590850" # Dfinity Admin
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHOEt0T+Hxxat5tbkD9mSu8T271QjRrLr2EA0rIDXUNL cardno:000614590748" # Dfinity Read-Only
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCJ08qswd3OoApAIHQwojEUJ4sre89vSngbM3x5pBP2 imalison@jay-lenovo.local" # Kat's Lenovo Legion
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOVGIGnpkU7HNQ/zl/Ffi562M+laWY9/yIjB63BCMiTS kat@nixcomp.local"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3tlMePru6ZlSuf8yUii3N1dy3WwJnSQAt3EgETkctK kat@jay-lenovo.local"
        ]
      ];
      group = "users";
      isNormalUser = true;
      createHome = true;
      shell = pkgs.zsh;
    };
    mike = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPnXd6c9xwr1yxBmxauj/FF3gnY8G11ospoM8i11mD2n countablecloud.com"
      ];
      group = "users";
      isNormalUser = true;
      createHome = true;
      shell = pkgs.zsh;
    };
  };
}
  '';
in
{

  imports = [ ./google-compute-config.nix ];

  options = {
    virtualisation.googleComputeImage.diskSize = mkOption {
      type = with types; either (enum [ "auto" ]) int;
      default = "auto";
      example = 1536;
      description = lib.mdDoc ''
        Size of disk image. Unit is MB.
      '';
    };

    virtualisation.googleComputeImage.configFile = mkOption {
      type = with types; nullOr str;
      default = null;
      description = lib.mdDoc ''
        A path to a configuration file which will be placed at `/etc/nixos/configuration.nix`
        and be used when switching to a new configuration.
        If set to `null`, a default configuration is used, where the only import is
        `<nixpkgs/nixos/modules/virtualisation/google-compute-image.nix>`.
      '';
    };

    virtualisation.googleComputeImage.compressionLevel = mkOption {
      type = types.int;
      default = 6;
      description = lib.mdDoc ''
        GZIP compression level of the resulting disk image (1-9).
      '';
    };
    virtualisation.googleComputeImage.efi = mkEnableOption "EFI booting";
  };

  #### implementation
  config = {
    boot.initrd.availableKernelModules = [ "nvme" ];
    boot.loader.grub = mkIf cfg.efi {
      device = mkForce "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
    };

    fileSystems."/boot" = mkIf cfg.efi {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };

    system.build.googleComputeImage = import ../../lib/make-disk-image.nix {
      name = "google-compute-image";
      postVM = ''
        PATH=$PATH:${with pkgs; lib.makeBinPath [ gnutar gzip ]}
        pushd $out
        mv $diskImage disk.raw
        tar -Sc disk.raw | gzip -${toString cfg.compressionLevel} > \
          nixos-image-${config.system.nixos.label}-${pkgs.stdenv.hostPlatform.system}.raw.tar.gz
        rm $out/disk.raw
        popd
      '';
      format = "raw";
      configFile = if cfg.configFile == null then defaultConfigFile else cfg.configFile;
      partitionTableType = if cfg.efi then "efi" else "legacy";
      inherit (cfg) diskSize;
      inherit config lib pkgs;
    };

  };

}
