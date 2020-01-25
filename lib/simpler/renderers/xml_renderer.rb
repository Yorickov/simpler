require 'gyoku'

module Simpler
  class XmlRenderer < BaseRenderer
    def content_type
      'application/xml'
    end

    def render
      Gyoku.xml(body)
    end
  end
end
