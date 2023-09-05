# Puppet lint last comment line check

This checks whether the last line in a class comment is an empty line

```
# @param mandatory
#   A mandatory parameter
# @option mandatory [String] hashkey
#   A key of the hash "mandatory" named "hashkey".
#
# @param withdefault
#   A parameter with a default value
#
# @param optional
#   An optional parameter
#
class my_class {
    Hash $mandatory,
    Boolean $withdefault = false,
    Optional[String] $optional = undef,
```

## Usage

To use the plugin, add the following line to the Gemfile:

    gem 'puppet-lint-last_comment_line-check'
