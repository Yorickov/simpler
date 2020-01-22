module Simpler
  class BaseRenderer
    class << self
      def types
        {
          plain: PlainRenderer,
          html: HtmlRenderer,
          js: JsRenderer,
          json: JsonRenderer,
          xml: XmlRenderer
        }
      end

      def create(opts)
        render_type, body = opts.to_a[0]
        types[render_type].new(body)
      end
    end

    def initialize(body)
      @body = body
    end

    def render
      body
    end

    protected

    attr_reader :body
  end
end
