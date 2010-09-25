# = pdf/merger/rjb.rb -- PDF template stamping.
#
#  Copyright (c) 2010 Paul Schreiber

$:.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'ext'))
require 'java'
require 'iText-4.2.0.jar'

include_class 'java.io.FileOutputStream'
include_class 'com.lowagie.text.pdf.PdfReader'
include_class 'com.lowagie.text.pdf.PdfCopyFields'

module PDF
  class Merger

    # Saves the PDF into a file defined by path given.
    def save_as(output_file_path)
      filestream = FileOutputStream.new(output_file_path)
      copy = PdfCopyFields.new(filestream)
      
      @files_to_merge.each do |f|
        copy.addDocument(PdfReader.new(f))
      end
      
      copy.close()
    end
  
  end
end
