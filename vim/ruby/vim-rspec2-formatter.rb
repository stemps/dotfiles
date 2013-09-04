require 'rspec/core/formatters/base_text_formatter'

class VimFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def dump_failures
    return if failed_examples.empty?
    output.puts
    output.puts "Failures:"
    failed_examples.each_with_index do |example, index|
      output.puts
      pending_fixed?(example) ? dump_pending_fixed(example, index) : dump_failure(example, index)
      quickfix_backtrace(example)
    end
  end

  def quickfix_backtrace(example)
    format_backtrace(example.execution_result[:exception].backtrace, example).each do |backtrace_info|
      output.puts detail_color("#{backtrace_info}")
    end
  end
end
