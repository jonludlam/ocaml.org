FROM ocaml/opam:ubuntu-ocaml-4.13
RUN sudo apt update; sudo apt install -y nodejs npm
RUN sudo mv -f /usr/bin/opam-2.1 /usr/bin/opam
ENV DUNE_BUILD_DIR /tmp/_build