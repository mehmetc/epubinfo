# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: epubinfo_with_toc 0.4.7 ruby lib

Gem::Specification.new do |s|
  s.name = "epubinfo_with_toc"
  s.version = "0.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christof Dorner", "Mehmet Celik"]
  s.date = "2014-01-11"
  s.description = "Supports EPUB2 and EPUB3 formats."
  s.email = "christof@chdorner.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "lib/epubinfo.rb",
    "lib/epubinfo/models/book.rb",
    "lib/epubinfo/models/cover.rb",
    "lib/epubinfo/models/date.rb",
    "lib/epubinfo/models/identifier.rb",
    "lib/epubinfo/models/person.rb",
    "lib/epubinfo/models/table_of_contents.rb",
    "lib/epubinfo/models/table_of_contents/resource.rb",
    "lib/epubinfo/parser.rb",
    "lib/epubinfo/utils.rb"
  ]
  s.homepage = "https://github.com/mehmetc/epubinfo/tree/table_of_contents"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.10"
  s.summary = "Extracts metadata information from EPUB files"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubyzip>, ["> 1.0.0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
    else
      s.add_dependency(%q<rubyzip>, ["> 1.0.0"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
      s.add_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_dependency(%q<yard>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
    end
  else
    s.add_dependency(%q<rubyzip>, ["> 1.0.0"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
    s.add_dependency(%q<rspec>, ["~> 2.14.1"])
    s.add_dependency(%q<yard>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
  end
end

