RSpec::Support.require_rspec_core "formatters/json_formatter"

class JsonOutputFormatter < RSpec::Core::Formatters::JsonFormatter
  RSpec::Core::Formatters.register self, :dump_summary

  def dump_summary(summary)
    total_points = summary.
    examples.
    map { |example| example.metadata[:points].to_i }.
    sum

    earned_points = summary.
    examples.
    select { |example| example.execution_result.status == :passed }.
    map { |example| example.metadata[:points].to_i }.
    sum

    @output_hash[:summary] = {
      duration: summary.duration,
      example_count: summary.example_count,
      failure_count: summary.failure_count,
      pending_count: summary.pending_count,
      total_points: total_points,
      earned_points: earned_points,
      score: (earned_points.to_f / total_points).round(4)
    }
    
    @output_hash[:summary_line] = [
      "#{summary.example_count} tests",
      "#{summary.failure_count} failures",
      "#{earned_points}/#{total_points} points",
      "#{(@output_hash[:summary][:score] * 100).round(2)}%",
    ].join(", ")
  end

  private

  def format_example(example)
    {
      description: example.description,
      full_description: example.full_description,
      hint: example.metadata[:hint],
      status: example.execution_result.status.to_s,
      points: example.metadata[:points],
      file_path: example.metadata[:file_path],
      line_number:  example.metadata[:line_number],
      run_time: example.execution_result.run_time,
    }
  end

end
