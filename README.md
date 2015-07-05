This is a small collection of fixes and adaptations I'm using for getting gb
projects to work more cleanly in Emacs.

Included are the following componets for now:

* A small helper script that copies the pkgs created by gb into a folder
  structure that can be used by [gocode][] (This you'll have to run whenever you
  build a new dependency inside the gb project)
* and an Elisp snippet that sets the GOPATH of a buffer accordingly if the
  edited file is located inside a gb project.


[gocode]: https://github.com/nsf/gocode
