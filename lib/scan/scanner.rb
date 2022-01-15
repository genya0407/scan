module Scan
  class Scanner
    def self.build(args: ARGV)
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

      output_format = Format.new(parser.parse(args).join(" "))
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
      @matcher = matcher
      @output_format = output_format
    end

    def scan(reader: $stdin, writer: $stdout)
      output = StringIO.new
      reader
        .readlines(chomp: true)
        .each do |line|
        matched_data = @matcher.match(line)
        if matched_data
          text = @output_format.render(matched_data)
          output.puts(text)
        end
      end
      writer.puts(output.string)
    end
  end
end
