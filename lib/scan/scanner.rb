module Scan
  class Scanner
    attr_accessor :matcher, :output_format

    def self.build(args: ARGV, format_builder: Format)
      regex = nil
      delimiter = nil
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: scan [options] OUTPUT_FORMAT"
        opts.on("-p [PATTERN]", "specify regexp") do |passed_regex|
          regex = passed_regex
        end
        opts.on("-d [DELIMITER]", "specify delimiter") do |passed_delimiter|
          delimiter = passed_delimiter
        end
      end

      output_format = format_builder.build(parser.parse(args).join(" "))
      matcher = if regex
          RegexpMatcher.new(regexp: regex)
        elsif delimiter
          DelimiterMatcher.new(delimiter: delimiter)
        else
          DelimiterMatcher.new(delimiter: '\s+')
        end

      Scanner.new(matcher: matcher, output_format: output_format)
    end

    def initialize(matcher:, output_format:)
      self.matcher = matcher
      self.output_format = output_format
    end

    def scan(reader: $stdin, writer: $stdout)
      output = StringIO.new
      reader
        .readlines(chomp: true)
        .each do |line|
        matched_data = matcher.match(line)
        next unless matched_data
        text = output_format.render(matched_data)
        output.puts(text)
      end
      writer.puts(output.string)
    end
  end
end
