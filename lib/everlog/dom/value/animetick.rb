class Everlog
  class Dom::Value::Animetick < Dom::Value
    include Maybe

    def title
      maybe(@response['title']).to_s
    end

    def sub_title
      maybe(@response['sub_title']).to_s
    end

    def count
      maybe(@response['count']).to_i
    end

    def updated_at
      DateTime.parse(@response['updated_at']).to_time
    end

    def updated_at_screen
      parse_to_His(maybe(@response['updated_at']).to_s)
    end
  end
end
