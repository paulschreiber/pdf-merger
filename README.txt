= pdf/merger - PDF Merging
  http://github.com/paulschreiber/pdf-merger/
  by Paul Schreiber

== DESCRIPTION:

Merge PDFs using iText.

== EXAMPLE:
require "pdf/merger"
pdf = PDF::Merger.new
pdf.add_file "foo.pdf"
pdf.add_file "bar.pdf"
pdf.save_as "combined.pdf"

== INSTALL:

$ sudo gem install pdf-merger

== ENCODING:

On some systems, such as Linux, you need to manually set the encoding. If you don't do that, merging on filenames with special characters will fail with a java.io.IOEXception (not found as file or resource). 

I added this line to my environments/production.rb to fix the problem:
ENV["LC_ALL"] = "en_US.utf8"

== CODE:

$ git clone http://github.com/paulschreiber/pdf-merger/

== LICENSE:

(The MIT License)

Copyright (c) 2010 Paul Schreiber

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
