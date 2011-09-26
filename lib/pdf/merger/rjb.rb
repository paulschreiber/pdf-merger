# = pdf/merger/rjb.rb -- PDF template stamping.
#
#  Copyright (c) 2010 Paul Schreiber

require 'rubygems'
require 'rjb'

Rjb::load(File.join(File.dirname(__FILE__), '..', '..', '..', 'ext', 'iText-4.2.0.jar'), ['-Djava.awt.headless=true'])

module PDF
  # PDF::Merger::RJB
  #
  # RJB needs the LD_LIBRARY_PATH and JAVA_HOME environment set for it
  # to work correctly.  For example on my system:
  #
  # export LD_LIBRARY_PATH=/usr/java/jdk1.6.0/jre/lib/i386/:/usr/java/jdk1.6.0/jre/lib/i386/client/:./
  # export JAVA_HOME=/usr/java/jdk1.6.0/
  #
  # Check the RJB documentation if you are having issues with this.
  class Merger
    # Saves the PDF into a file defined by path given.
    # return the number of pages in the new file
    def save_as(output_file_path)
      @pdfreader     = Rjb::import('com.lowagie.text.pdf.PdfReader')
      @pdfcopyfields = Rjb::import('com.lowagie.text.pdf.PdfCopyFields')
      @filestream    = Rjb::import('java.io.FileOutputStream')

      filestream = @filestream.new(output_file_path)
      copy = @pdfcopyfields.new(filestream)
      
      @files_to_merge.each do |f|
        copy.addDocument(@pdfreader.new(f))
      end
      
      copy.close()
      @pdfreader.new(output_file_path).getNumberOfPages
    end
  
  end
end
