# = pdf/merger/rjb.rb -- PDF template stamping.
#
#  Copyright 2010-12 Paul Schreiber

$:.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'ext'))
require 'java'
require 'iText-4.2.0.jar'

java_import 'java.io.FileOutputStream'
java_import 'com.lowagie.text.pdf.PdfReader'
java_import 'com.lowagie.text.pdf.PdfCopyFields'

module PDF
  class Merger

    # Saves the PDF into a file defined by path given.
    # - return the number of pages in the new file
    # - populate failure_list with paths of missing or invalid PDFs
    def save_as(output_file_path, failure_list=[])
      filestream = FileOutputStream.new(output_file_path)
      copy = PdfCopyFields.new(filestream)
      
      @files_to_merge.each do |f|
        if File.exists?(f)
          begin
            copy.addDocument(PdfReader.new(f))
          rescue => e
            failure_list << f
            Rails.logger.warn "PDF::Merger: Invalid PDF: #{f}"
          end
        else
          failure_list << f
          Rails.logger.warn "PDF::Merger: File does not exist: #{f}"
        end
      end
      
      if @files_to_merge.size - failure_list.size > 0
        copy.addJavaScript(@js) if @js.present?
        copy.close()
        PdfReader.new(output_file_path).getNumberOfPages
      else
        0
      end
    end
  
  end
end
