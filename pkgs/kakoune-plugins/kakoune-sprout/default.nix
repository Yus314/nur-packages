{
  lib,
  stdenv,
  source,
  sprout,
  jq,
}:

stdenv.mkDerivation {
  pname = "kakoune-sprout";
  inherit (source) version src;

  dontBuild = true;

  installPhase =
    let
      sproutBin = lib.getExe sprout;
      jqBin = lib.getExe jq;
    in
    ''
      plugin_dir="$out/share/kak/autoload/plugins/sprout"
      mkdir -p "$plugin_dir"
      substitute kak/sprout.kak "$plugin_dir/sprout.kak" \
        --replace-fail '$(sprout ' '$(${sproutBin} ' \
        --replace-fail '| jq ' '| ${jqBin} '
    '';

  meta = {
    description = "Kakoune integration for sprout evergreen note CLI";
    homepage = "https://github.com/Yus314/sprout";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
}
