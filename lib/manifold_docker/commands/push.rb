# frozen_string_literal: true

require_relative '../command'
require_relative './base'

module ManifoldDocker
  module Commands
    class Push < Base
      def initialize(version, options)
        @version = version
        @options = options
      end

      def execute(input: $stdin, output: $stdout)

      end
    end
  end
end
