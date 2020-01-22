require_relative 'view'
require_relative 'renderer'

module Simpler
  class Controller
    attr_reader :name, :request, :response

    def initialize(env)
      @name = extract_name
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
    end

    def make_response(action, attributes)
      @request.env['simpler.controller'] = self
      @request.env['simpler.action'] = action
      @request.env['simpler.attributes'] = attributes

      set_default_headers
      send(action)
      write_response

      @response.finish
    end

    private

    def extract_name
      self.class.name.match('(?<name>.+)Controller')[:name].downcase
    end

    def status(status_code)
      @response.status = status_code
    end

    def headers
      response
    end

    def set_default_headers
      headers['Content-Type'] = 'text/html'
    end

    def write_response
      body = request.env['simpler.body'] || render_default_body

      @response.write(body)
    end

    def render_default_body
      View.new(request.env).render(binding)
    end

    def params
      @request.params.merge(@request.env['simpler.attributes'])
    end

    def render(template)
      template.is_a?(Hash) ? set_raw_body(template) : set_default_body(template)
    end

    def set_raw_body(opts)
      renderer = Renderer.new(opts)

      headers['Content-Type'] = renderer.content_type
      @request.env['simpler.body'] = renderer.prepared_body
    end

    def set_default_body(template)
      @request.env['simpler.template'] = template
    end
  end
end
