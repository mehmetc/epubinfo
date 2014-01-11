require 'uri'

class Resource
  include Enumerable

  def initialize(table_of_contents)
    @table_of_contents = table_of_contents
  end

  def length
    self.count
  end

  def first
    self.to_a.first
  end

  def last
    self.to_a.last
  end

  def [](reference)
    if reference.is_a?(Integer)
      return self.to_a[reference]
    elsif reference.is_a?(Range)
      return self.to_a[reference]
    elsif reference.is_a?(Symbol)
      reference = reference.to_s
    end

    if reference.is_a?(String)
      reference_data = self.to_a.map do |r|
        r[:uri] if r[:id].eql?(reference) || r[:uri].eql?(reference) || r[:uri_ref].eql?(reference)
      end.compact

      if reference_data && !reference_data.empty?
        return @table_of_contents.parser.zip_file.read(reference_data.first)
      end
    end

    return self.to_a
  end

  def each
    self.to_a.each do |resource|
      yield resource
    end
  end

  def keys
    @keys ||= self.to_a.map{|r| r[:id]}
  end

  def types
    @types ||= self.to_a.map{|r| r[:type]}.uniq

  end

  def spine
    @spine ||=
    begin
      spine_resources = @table_of_contents.spine.first.xpath('./itemref').map { |s| s['idref'] }
      self.to_a.select {|r| spine_resources.include?(r[:id])}
    end
  end

  def ncx
    @ncx ||=
        begin
          @table_of_contents.ncx.nav_map.map do |n|
            path = URI.decode(n['path'])
            {:uri_ref => path,
             :text => n['label'],
             :uri => @table_of_contents.parser.zip_file.entries.map { |p| p.name }.select { |s| s.match(path.gsub(/\#.*$/, '')) }.first
            }
          end
        end
  end

  def images
    @images ||= self.to_a.select {|r| r[:type] =~ /image/}
  end

  def videos
    @videos ||= self.to_a.select {|r| r[:type] =~ /video/}
  end

  def fonts
    @fonts ||= self.to_a.select {|r| r[:type] =~ /font/}
  end

  def javascripts
    @js ||= self.to_a.select {|r| r[:type] =~ /text\/javascript/}
  end

  def css
    @css ||= self.to_a.select {|r| r[:type] =~ /text\/css/}
  end

  def to_a
    @resources ||=
        begin
          resources = []
          @table_of_contents.manifest.xpath('//item').each do |resource|
            if resource
              id = resource.attr('id')
              uri = URI.decode(resource.attr('href'))
              mime_type = resource.attr('media-type')
              label = ''
              uri_ref = ''
              order = ''

              nav_point = @table_of_contents.document.xpath("//navPoint[starts-with(content/@src,'#{uri}')]").first
              if nav_point
                label = nav_point.at('navLabel text').content || ''
                uri_ref = nav_point.at('content').attr('src') || ''
                order = nav_point.attr('playOrder') || ''
              end

              #TODO:make this an OpenStruct

              uri = @table_of_contents.parser.zip_file.entries.map { |p| p.name }.select { |s| s.match(uri.gsub(/\#.*$/, '')) }.first
              resources << {:id => id,
                            :uri => uri,
                            :uri_ref => uri_ref,
                            :text => label,
                            :type => mime_type,
                            :order => order}
            end
          end

          resources
        end
  end
end