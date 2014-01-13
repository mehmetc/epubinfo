# epubinfo [![Continuous Integration](https://travis-ci.org/mehmetc/epubinfo.png?branch=table_of_contents)](http://travis-ci.org/mehmetc/epubinfo)
Extracts metadata information from EPUB files. Supports EPUB2 and EPUB3 formats.

This is a fork of epubinfo written by [![Christof Dorner](https://github.com/chdorner/epubinfo)].
With this version you can query the Table Of Contents of an EPUB.

Until this branch gets merged into the master you can install it by

```
gem install epubinfo_with_toc
```

or in your Gemfile

```
gem 'epubinfo_with_toc'
```

## Usage

```ruby
require 'epubinfo'
book = EPUBInfo.get('path/to/epub/file.epub')
```

Which returns a `EPUBInfo::Models::Book` instance, please refer to the [API documentation](http://rubydoc.info/gems/epubinfo/frames) from here on

## Resources

### Querying all resource
 ```ruby
all_resources = book.table_of_contents.resources.to_a
```

### Querying by URI
```ruby
page 1 = Nokogiri::HTML(book.table_of_contents.resources['page1.html'])
```

### Querying by id
```ruby
page 2 = Nokogiri::HTML(book.table_of_contents.resources['page2'])
page 3 = Nokogiri::HTML(book.table_of_contents.resources[:page3])
```

### Querying for a range
```ruby
pages1_4 = book.table_of_contents.resources[0..3]
```

### Querying for a list of specific resources
```ruby
images = book.table_of_contents.resources.images
fonts  = book.table_of_contents.resources.fonts
videos = book.table_of_contents.resources.videos
js     = book.table_of_contents.resources.javascripts
css    = book.table_of_contents.resources.css
```

### Get a list of all the different mime-types used
```ruby
types = book.table_of_contents.resources.types
```

### print SPINE text
```ruby
resources = {}
book.table_of_contents.resources.spine.each do |resource|
    puts resource[:text]
end
```

## Changelog
**0.5.2** *Januari 13,2014*

* navPoint can be nested.

**0.5.0** *Januari 11,2014*

* A lot of bugfixing

**0.4.4** *October 24,2013*

* added table of contents

**0.4.3** *September 12, 2013*

* Made cover detection more robust by escaping the CSS selectors (by [versapub](https://github.com/versapub))

**0.4.2** *August 16, 2013*

* Improved cover detection for EPUB3 (by [takahashim](https://github.com/takahashim))
* Improved cover detection for EPUB2 (by [cyrret](https://github.com/cyrret))

**0.4.1** *February 15, 2013*

* Added Book#version to get EPUB version of the file (by [takahashim](https://github.com/takahashim))
* Added support for modified_date in Book#dates (by [takahashim](https://github.com/takahashim))

**0.4.0** *July 31, 2012*

* Added Book#cover method for extracting covers from epubs

**0.3.6** *June 18, 2012*

* Upgraded rubyzip dependency to version 0.9.9 for more robust zip handling

**0.3.5** *June 17, 2012*

* Reading out path of root document is more robust (removing XML namespaces)

**0.3.4** *June 1, 2012*

* Default value for titles (empty array)
* Code refactorings

*For older versions compare commits with git.*

## Contributing to epubinfo
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Christof Dorner. See LICENSE.txt for
further details.

