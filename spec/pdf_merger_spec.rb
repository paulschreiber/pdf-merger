$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'pdf/merger'

describe PDF::Merger do
  before(:each) do
    @pdf = PDF::Merger.new
    @pdf.add_file :text_field01, "test_template.pdf"
    @pdf.add_file :text_field02, "test_template.pdf"
  end

  it "should create PDF document" do
    @pdf.to_s.should_not be_nil
  end

  it "should save PDF document" do
    @pdf.save_as "test_output.pdf"
    File.exist?("test_output.pdf").should be_true
    File.delete("test_output.pdf") # Comment this out to view the output
  end
end
