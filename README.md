# PDF Merging (pdf/merger)
by Paul Schreiber

[Github repo](http://github.com/paulschreiber/pdf-merger/)

Merge PDFs using iText.

## Ruby

    require "pdf/merger"
    failure_list = []
    pdf = PDF::Merger.new
    pdf.add_file "foo.pdf"
    pdf.add_file "bar.pdf"
    pdf.add_javascript "this.print(true);"
    pdf.save_as "combined.pdf", failure_list

## Rails

### Installation

    # Gemfile.rb
    gem 'rjb'
    gem 'pdf-merger'

As always:

    $ bundle install
    $ rails server

## Encoding

On some systems, such as Linux, you need to manually set the encoding. If you don't do that, merging on filenames with special characters will fail with a java.io.IOEXception (not found as file or resource).

I added this line to my `environments/production.rb` to fix the problem:

    # environments/production.rb
    ENV["LC_ALL"] = "en_US.utf8"

## License

Copyright 2010-14 Paul Schreiber. Released under the MIT License.
See LICENSE.txt for further details.