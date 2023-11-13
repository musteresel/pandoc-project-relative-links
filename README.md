# pandoc-project-relative-links

[![Haskell CI](https://github.com/musteresel/pandoc-project-relative-links/actions/workflows/haskell.yml/badge.svg)](https://github.com/musteresel/pandoc-project-relative-links/actions/workflows/haskell.yml)

This is a [pandoc](https://pandoc.org) filter that allows one to use
absolute links but have them be relative to the root directory of your
project.  So, a link to `/my/path` is changed to `../../my/path` when
the supplied path to the project root directory is given as `../../`.

The path to the root directory must be explicitly specified by the
`pathToProjectRoot` meta variable (specified in the YAML front matter
or with `-M` on the commandline).

For an example of it's usage see https://github.com/musteresel/pandoc-project-relative-links/issues/1#issuecomment-1807225847
