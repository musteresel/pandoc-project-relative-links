# Revision history for pandoc-project-relative-links

## Unreleased

## 0.1.0.1  -- 2023-11-12
### Fixes
- Fixed build, switched to Data.Text internally

## 0.1.0.0  -- 2017-12-31
### Added
- Basic functionality: read `pathToProjectRoot` meta variable and
  change absolute links (starting with an `/`) into links relative to
  the project root.
- Same for image links.

