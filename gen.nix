{ mkDerivation, base, containers, hspec, pandoc, pandoc-types
, stdenv
}:
mkDerivation {
  pname = "pandoc-project-relative-links";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base containers pandoc pandoc-types ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ base hspec pandoc pandoc-types ];
  homepage = "https://github.com/musteresel/pandoc-project-relative-links";
  description = "Pandoc filter for project-relative links";
  license = stdenv.lib.licenses.mit;
}
