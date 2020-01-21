require 'json'
require 'gyoku'

class Renderer
  TYPES = {
    plain: { content_type: 'text/plain' },
    html: { content_type: 'text/html' },
    js: { content_type: 'text/javascript' },
    json: { content_type: 'application/json', renderer: ->(b) { b.to_json } },
    xml: { content_type: 'application/xml', renderer: ->(b) { Gyoku.xml(b) } }
  }.freeze

  attr_reader :content_type

  def initialize(opts)
    render_type, @body = opts.to_a[0]

    @content_type = TYPES[render_type][:content_type]
    @renderer = TYPES[render_type][:renderer]
  end

  def prepared_body
    renderer ? renderer.call(body) : body
  end

  private

  attr_reader :renderer, :body
end
