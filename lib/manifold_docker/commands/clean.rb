# frozen_string_literal: true
require "pathname"
require "tty-command"
require_relative '../command'
require_relative './base'

module ManifoldDocker
  module Commands
    class Clean < Base

      def initialize(version, options)
        @version = version
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        image_names.each do |image|
          clean_image(image, @version)
        end
      end

    end
  end
end
