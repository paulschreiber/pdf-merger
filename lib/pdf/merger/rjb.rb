# = pdf/merger/rjb.rb -- PDF template stamping.
#
#  Copyright 2010-12 Paul Schreiber

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
    # - return the number of pages in the new file
    # - populate failure_list with paths of missing or invalid PDFs
    def save_as(output_file_path, failure_list=[])
      @pdfreader     = Rjb::import('com.lowagie.text.pdf.PdfReader')
      @pdfcopyfields = Rjb::import('com.lowagie.text.pdf.PdfCopyFields')
      @filestream    = Rjb::import('java.io.FileOutputStream')

      filestream = @filestream.new(output_file_path)
      copy = @pdfcopyfields.new(filestream)
      
      @files_to_merge.each do |f|
        if File.exists?(f)
          begin
            copy.addDocument(@pdfreader.new(f))
          rescue => e
            failure_list << f
            log "PDF::Merger: Invalid PDF: #{f}"            
          end
        else
          failure_list << f
          log "PDF::Merger: File does not exist: #{f}"
        end
      end
      
      if @files_to_merge.size - failure_list.size > 0
        copy.addJavaScript(@js) if @js && !@js.empty?
        copy.close()
        @pdfreader.new(output_file_path).getNumberOfPages
      else
        0
      end
    end
  
  end
end
