# = pdf/merger.rb -- PDF merging
#
#  Copyright 2010-12 Paul Schreiber

require 'rbconfig'
require 'fileutils'
require 'tmpdir'

include FileUtils

module PDF
  class Merger
    VERSION = "0.3.1"
    
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
      @js = nil
    end
    
    def add_javascript(js)
      @js = js
    end
    
    def add_file(file_path)
      @files_to_merge << file_path
    end

    def log(message)
      if defined? Rails
        Rails.logger.warn message
      else
        puts message
      end
    end
        
  end
end
    
