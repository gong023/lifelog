class Lifelog
  class Dom::Value::Moves
    require 'lifelog/dom/value/moves/summary'
    require 'lifelog/dom/value/moves/place'
    require 'lifelog/dom/value/moves/move'
    require 'lifelog/dom/value/moves/referer'

    def initialize response
      @response = response
    end

    def round_off float
      "%.1f" % float
    end

    def km
      1000
    end
  end
end