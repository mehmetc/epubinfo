require 'spec_helper'

describe EPUBInfo::Models::TableOfContents do
  describe "#new" do
    context "EPUB2" do
      subject do
        path = 'spec/support/binary/coverinroot_epub2.epub'
        parser = EPUBInfo::Parser.parse(path)
        EPUBInfo::Models::TableOfContents.new(parser)
      end

      it "should have a type" do
        subject.type.should == 'ncx'
      end

      it "should point to the TOC file" do
        subject.path.should == 'epb.ncx'
      end

      it "should be possible to get the raw TOC" do
        subject.document.should be_kind_of Nokogiri::XML::Document
      end

      it "should return the parsed TOC as a list or resources" do
        subject.resources.should be_kind_of Resource
        subject.resources.count.should == 4
        subject.resources.spine.count.should == 1
        subject.resources.images.count.should == 1
        subject.resources.fonts.count.should == 0
        subject.resources.videos.count.should == 0
        subject.resources.types.should be_kind_of Array
        subject.resources.types.count.should == 4
        subject.resources.types.select {|i| i =~ /image/}.first.should eql('image/png')
        subject.resources.first[:text].should.eql?('Section 1')
        subject.resources[0..1].should be_kind_of Array
        subject.resources[0..1].map{|m| m[:uri]}.should == ["chapter-1.xhtml", "cover-image.png"]
      end

    end

    context 'EPUB2 extended' do
      subject do
        path = 'spec/support/binary/Verne_20000_West_pg11393.epub'
        parser = EPUBInfo::Parser.parse(path)
        EPUBInfo::Models::TableOfContents.new(parser)
      end

      it "should have a type" do
        subject.type.should == 'ncx'
      end

      it "should point to the TOC file" do
        subject.path.should == 'OEBPS/toc.ncx'
      end

      it "should be possible to get the raw TOC" do
        subject.document.should be_kind_of Nokogiri::XML::Document
      end

      it "should return the parsed TOC as a list or resources" do
        subject.resources.should be_kind_of Resource
        subject.resources.count.should == 6
        subject.resources.spine.count.should == 3
        subject.resources.images.count.should == 1
        subject.resources.fonts.count.should == 0
        subject.resources.videos.count.should == 0
        subject.resources.types.should be_kind_of Array
        subject.resources.types.count.should == 4
        subject.resources.types.select {|i| i =~ /image/}.first.should eql('image/jpeg')
        subject.resources.first[:text].should.eql?('Section 1')
        subject.resources[0..1].should be_kind_of Array
        subject.resources[0..1].map{|m| m[:uri]}.should == ["OEBPS/Styles/pgepub.css", "OEBPS/Text/www.gutenberg.org@files@11393@11393-8-0.html"]
      end
    end




    context "EPUB3" do
      subject do
        path = 'spec/support/binary/wasteland_epub3.epub'
        parser = EPUBInfo::Parser.parse(path)
        EPUBInfo::Models::TableOfContents.new(parser)
      end

      it "should have a type" do
        subject.type.should == 'ncx'
      end

      it "should point to the TOC file" do
        subject.path.should == 'EPUB/wasteland.ncx'
      end

      it "should be possible to get the raw TOC" do
        subject.document.should be_kind_of Nokogiri::XML::Document
      end

      it "should return the parsed TOC as a list or resources" do
        subject.resources.should be_kind_of Resource
        subject.resources.count.should == 6
        subject.resources.spine.count.should == 1
        subject.resources.images.count.should == 1
        subject.resources.fonts.count.should == 0
        subject.resources.videos.count.should == 0
        subject.resources.types.should be_kind_of Array
        subject.resources.types.count.should == 4
        subject.resources.types.select {|i| i =~ /image\/jpeg/}.first.should eql('image/jpeg')
        subject.resources.first[:text].should.eql?('Section 1')
        subject.resources[0..1].should be_kind_of Array
        subject.resources[0..1].map{|m| m[:uri]}.should == ["EPUB/wasteland-content.xhtml", "EPUB/wasteland-nav.xhtml"]
      end

    end
  end
end