# Comments
# http://docs.puppetlabs.com/guides/style_guide.html#comments

class PuppetLint::Plugins::CheckComments < PuppetLint::CheckPlugin
  check 'comments' do
    line_no = 0
    manifest_lines.each do |line|
      line_no += 1

      # Should not use // or /* ... */ for comments
      notify :warning, :message =>  "/* comment found", :linenumber => line_no if line.include? "/*"
      notify :warning, :message =>  "// comment found", :linenumber => line_no if line =~ /\s+\/\//
    end
  end
end
