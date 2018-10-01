# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.3.1] -
- (DEV) Update code with rubocop formatter.
- (DEV) Port test execution to rake.


## [0.3.0] -
### Added
- (DEV) Add test script.
- (DEV) Add trevis support.
- (DEV) Add support for `enabled:false` in a test case.
- Add `extract_path` and `extract_qs` filters.
- Add `array_head`, `array_tail` and `array_to_taglist` filters.

### Fixed
- Fix `extract_dirname` when it's only `/index.html`.


## [0.2.0] -
### Added
- Add jekyllrb and installation information to README.md.
- Add badge to README.md.


## [0.1.0] -
### Added
- Add filters: remove_ext, remove_qs, extract_basename, extract_dirname, extract_protocol.
