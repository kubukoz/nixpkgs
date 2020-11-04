{ stdenv
, fetchFromGitHub
, autoreconfHook
, pkg-config
, glib
, libcap
, libseccomp
, libslirp
, nixosTests
}:

stdenv.mkDerivation rec {
  pname = "slirp4netns";
  version = "1.1.6";

  src = fetchFromGitHub {
    owner = "rootless-containers";
    repo = "slirp4netns";
    rev = "v${version}";
    sha256 = "1nspvzcpwmaipdq49jm7z3ymdg95zqgcyv1cjfs1zb950knrrggr";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ glib libcap libseccomp libslirp ];

  enableParallelBuilding = true;

  passthru.tests = { inherit (nixosTests) podman; };

  meta = with stdenv.lib; {
    homepage = "https://github.com/rootless-containers/slirp4netns";
    description = "User-mode networking for unprivileged network namespaces";
    license = licenses.gpl2;
    maintainers = with maintainers; [ orivej ] ++ teams.podman.members;
    platforms = platforms.linux;
  };
}
