require 'ruble'
    
command t(:insert_period_at_eol) do |cmd|
  cmd.key_binding = 'OPTION+COMMAND+ENTER'
  cmd.scope = 'text'
  cmd.output = :replace_selection
  cmd.input = :line
  cmd.invoke do |context|
    $stdin.read()[/^(.*?)\s*$/, 1] + "."
  end
end
