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

### Carrierwave

[Carrierwave gem](https://github.com/carrierwaveuploader/carrierwave).

By default Carrierwave uploads files into `/public/uploads`.  Here is an example to merge all attachments on a standard `user` model into a single `report` file, stored in `/tmp`.

    #models/user.rb
    class User < ActiveRecord::Base
      has_many :attachments, dependent: :destroy
      accepts_nested_attributes_for :attachments, :allow_destroy => true
    end

    #config/routes.rb
    get 'users/:id/report' => 'users#report', as: :users_report

    #views/users/show.html.erb
    <%= link_to 'Report', users_report_path(@user) %>

    #app/controllers/users_controller.rb
    def report
        failure_list = []
        pdf = PDF::Merger.new

        if @user.attachments.empty?
          flash[:error] = 'No attachments.'
        else
          for attachment in @user.attachments
            # Note the .to_s, otherwise code fails by passing a Ruby item rather than string into add_file
            pdf.add_file Rails.root.join("public#{attachment.file.to_s}").to_s
          end

          # Best to have some kind of unique identifier in the file name so they aren't constantly overwriting each other
          save_path = Rails.root.join('tmp', "report - #{@user.email}.pdf").to_s
          pdf.save_as(save_path, failure_list)
          # File now stored in tmp
          # Manipulate the file here (eg. send out via email), then uncomment the line below if you want it deleted.  
          # Comment the line below to examine file for testing purposes
          #File.delete(save_path)

          flash[:notice] = 'Report successfully generated.'
        end

        redirect_to @user
      end

## Encoding

On some systems, such as Linux, you need to manually set the encoding. If you don't do that, merging on filenames with special characters will fail with a java.io.IOEXception (not found as file or resource). 

I added this line to my `environments/production.rb` to fix the problem:

    # environments/production.rb
    ENV["LC_ALL"] = "en_US.utf8"

## License

Copyright 2010-12 Paul Schreiber. Released under the MIT License.
See LICENSE.txt for further details.