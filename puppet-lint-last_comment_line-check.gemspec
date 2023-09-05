Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-last_comment_line-check'
  spec.version     = '0.1.0'
  spec.homepage    = 'https://github.com/dodevops/puppet-lint-last_comment_line-check'
  spec.license     = 'MIT'
  spec.author      = 'Dennis Ploeger'
  spec.email       = 'develop@dieploegers.de'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'An opinionated puppet lint check for checking if the last line of a comment is blank'
  spec.description = <<-DESC
    An opinionated puppet lint check for checking if the last line of a comment is blank.
  DESC

  spec.add_dependency             'puppet-lint', '> 1.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end