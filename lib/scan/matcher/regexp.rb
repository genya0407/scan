module Scan
  module Matcher
    class Regexp
      def initialize(regexp:)
        @regexp = ::Regexp.compile regexp
      end

      def match(line)
        @regexp.match(line)
      end
    end
  end
end
