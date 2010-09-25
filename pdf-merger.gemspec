# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pdf-merger}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Schreiber"]
  s.date = %q{2010-09-24}
  s.description = %q{Merge PDFs using iText. == EXAMPLE: pdf = PDF::Merger.new pdf.add_file 'foo.pdf' pdf.add_file 'bar.pdf' pdf.save_as 'combined.pdf'"}
  s.email = %q{paulschreiber@gmail.com}
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "ext/iText-4.2.0.jar", "lib/pdf/merger.rb", "lib/pdf/merger/jruby.rb", "lib/pdf/merger/rjb.rb", "spec/pdf_merger_spec.rb", "spec/test_template.pdf"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/paulschreiber/pdf-merger/}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{pdf-merger}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merge PDFs using iText.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
