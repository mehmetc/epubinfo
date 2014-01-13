class Navigation
  def initialize(table_of_contents)
    @table_of_contents = table_of_contents
  end

  def path
    @table_of_contents.path
  end

  def nav_map
    ncx_doc = Nokogiri::XML(@table_of_contents.parser.zip_file.read(path))
    ncx_doc.remove_namespaces!

    if ncx_doc
      #map = ncx_doc.xpath('//navMap/navPoint').map do |navpoint|
      map = ncx_doc.xpath('//navPoint').map do |navpoint|
        {'label' =>(navpoint % 'navLabel/text').content , 'path' => (navpoint % 'content').attr('src')}
      end
    end

  end

end