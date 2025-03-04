{ ... }:

{
  programs.chromium.extraOpts = {
    "ExtensionManifestV2Availability" = 2;
  };
}