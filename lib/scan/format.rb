module Scan
  class Format
    def initialize(template_string)
      remain = template_string
      @sseq = []
      while (m = remain.match(/^(.*?)\{(.+?)\}(.*)$/))
        _, pre, capt, rem = m.to_a
        raise "Unexpected!" if pre.nil? || capt.nil? || rem.nil?

        @sseq.push(pre)
        capture = capt.match?(/\d+/) ? capt.to_i : capt
        @sseq.push(Placeholder.new(capture: capture))
        remain = rem
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
