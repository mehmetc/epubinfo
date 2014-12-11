# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epubinfo/version'

Gem::Specification.new do |spec|
  spec.name          = "epubinfo_with_toc"
  spec.version       = EpubinfoWithToc::VERSION
  spec.authors       = ["Christof Dorner", "Mehmet Celik"]
  spec.email         = ["christof@chdorner.com"]
  spec.description   = "Supports EPUB2 and EPUB3 formats."
  spec.summary       = "Supports EPUB2 and EPUB3 formats."
  spec.homepage      = "https://github.com/mehmetc/epubinfo/tree/table_of_contents"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"

  spec.add_dependency "nokogiri"
  spec.add_dependency "rubyzip"
end
