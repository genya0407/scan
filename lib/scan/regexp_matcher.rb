module Scan
  class RegexpMatcher
    def initialize(regexp:)
      @regexp = Regexp.compile regexp
    end

    def match(line)
      @regexp.match(line)
    end
  end
end
