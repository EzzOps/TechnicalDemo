apk info --- command to see the avalable pacvckages in the image


```yaml
package:
  name: binutils
  version: 2.39
  epoch: 0
  description: "GNU binutils"
  target-architecture:
    - all
  copyright:
    - paths:
      - "*"
      attestation: TODO
      license: GPL-3.0-or-later
  dependencies:
    runtime:

environment:
  contents:
    repositories:
      - https://mirrors.edge.kernel.org/alpine/edge/main

    keyring:
      - /usr/share/apk/keys/x86_64/alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub

    packages:
      - alpine-baselayout


pipeline:
  - uses: fetch
    with:
      uri: https://ftp.gnu.org/gnu/binutils/binutils-${{package.version}}.tar.gz
      expected-sha256: d12ea6f239f1ffe3533ea11ad6e224ffcb89eb5d01bbea589e9158780fa11f10
  - name: 'Configure binutils'
    runs: |
      ./configure \

  - runs: |
      make -j$(nproc) V=1
  - uses: autoconf/make
  - uses: autoconf/make-install
  - uses: strip      
```      