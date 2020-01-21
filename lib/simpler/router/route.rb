module Simpler
  class Router
    class Route
      attr_reader :controller, :action
      attr_accessor :attributes

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
      end

      def match?(method, request_path)
        return false unless @method == method

        pattern =
          @path
          .gsub(/(:[^\/]+)/) { |match| "(?<#{match[1..-1]}>[\\w-]+)" }
          .gsub('/', '\/')

        match = Regexp.new("^#{pattern}$").match(request_path)
        return false unless match

        self.attributes = match.named_captures
        true
      end
    end
  end
end
