# = pdf/merger.rb -- PDF merging
#
#  Copyright (c) 2010 Paul Schreiber

require 'rbconfig'
require 'fileutils'
require 'tmpdir'

include FileUtils

module PDF
  class Merger
    VERSION = "0.1.1"
    
    if RUBY_PLATFORM =~ /java/ # ifdef to check if your using JRuby
      require 'pdf/merger/jruby'
    else
      require 'pdf/merger/rjb'
    end
    # PDF::Merger provides an interface into iText allowing for the
    # merging of PDFs.
    #
    # == Example
    #
    # pdf = PDF::Merger.new
    # pdf.add_file "foo.pdf"
    # pdf.add_file "bar.pdf"
    # pdf.save_as "combined.pdf"
    
    def initialize
      @files_to_merge = []
    end
    
    def add_file(file_path)
      @files_to_merge << file_path
    end
        
  end
end
    
