require 'ruble'

command t(:copy_non_matching_lines) do |cmd|
  cmd.output = :create_new_document
  cmd.input = :document
  cmd.invoke do |context|
    res = Ruble::UI.request_string(:title => 'Filter Non-Matching Lines', :prompt => 'Enter a pattern:', :button1 => 'Filter', :button2 => 'Cancel')
    context.exit_discard unless res
    res = res.to_s
    # Now go through every line in STDIN and print all non-matches!
    $stdin.readlines.each {|line| puts line if !line.match(res) }
    nil
  end
end
