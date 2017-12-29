# pandoc-project-relative-links

This is a [pandoc][] filter that allows one to use absolute links but
have them be relative to the root directory of your project.  So, a
link to `/my/path` is changed to `../../my/path` when the supplied
path to the project root directory is given as `../../`.

The path to the root directory may either be explicitly specified by
the `pathToProjectRoot` meta variable (specified in the YAML front
matter or with `-M` on the commandline) or infered from the
`sourcePath` meta variable.
