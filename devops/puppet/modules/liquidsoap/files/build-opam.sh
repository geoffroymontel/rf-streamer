#!/bin/bash

SHELL=/bin/bash
HOME=/home/vagrant
PATH=/bin:/usr/bin:/usr/local/bin

verlte() {
    [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
}

if ! which opam > /dev/null 2>&1 || verlte `opam --version` 1.2 > /dev/null 2>&1; then
  cd /home/vagrant
  sudo add-apt-repository ppa:avsm/ppa
  sudo apt-get update
  sudo apt-get install -y ocaml ocaml-native-compilers camlp4-extra opam

  echo "initializing opam for `whoami`"
  opam init --yes

  tee -a /home/vagrant/.profile >/dev/null << "EOF"
. /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
EOF

  tee -a /home/vagrant/.ocamlinit >/dev/null << "EOF"
let () =
  try Topdirs.dir_directory (Sys.getenv "OCAML_TOPLEVEL_PATH")
  with Not_found -> ()
;;
EOF

  eval `opam config env`

  opam install pcre --yes
  opam install camomile --yes
  opam install xmlm --yes
  opam install base-bytes --yes
fi
