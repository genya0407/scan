module Scan
  class Format
    def self.build(template_string)
      self.new(template_string)
    end

    def initialize(template_string)
      remain = template_string
      @sseq = []
      while m = remain.match(/^(.*?)\{(.+?)\}(.*)$/)
        @sseq.push(m[1])
        capture = m[2].match?(/\d+/) ? m[2].to_i : m[2]
        @sseq.push(Placeholder.new(capture: capture))
        remain = m[3]
      end
      @sseq.push(remain)
    end

    def render(params)
      @sseq.map do |s|
        case s
        when String
          s
        when Placeholder
          params[s.capture]
        else
          raise "Unexpected object: #{s.inspect}"
        end
      end.join("")
    end

    class Placeholder < Struct.new(:capture, keyword_init: true); end
  end
end
