# frozen_string_literal: true

require_relative '../command'
require_relative './base'

module ManifoldDocker
  module Commands
    class Push < ManifoldDocker::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
      end
    end
  end
end
