Pry.config.print = proc do |output, value, _pry_|
  case value
  when ActiveRecord::Relation
    output.puts "=> #{value.to_s}"
  else
    Pry::DEFAULT_PRINT.call(output, value, _pry_)
  end
end
