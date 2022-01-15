module Scan
  class DelimiterMatcher
    def initialize(delimiter:)
      @delimiter_regex = Regexp.compile delimiter
    end

    def match(line)
      format_params = {}
      [line, *line.split(@delimiter_regex)].each.with_index do |capture, index|
        format_params[index] = capture
      end
      format_params
    end
  end
end
