require 'json'

module Simpler
  class JsonRenderer < BaseRenderer
    def content_type
      'application/json'
    end

    def render
      body.to_json
    end
  end
end
