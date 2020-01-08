# frozen_string_literal: true
require "pathname"
require "tty-command"
require_relative '../command'
require_relative './base'

module ManifoldDocker
  module Commands
    class Check < Base

      def initialize(version, options)
        @version = version
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        exists = image_names.all? do |image|
          image_exists?(image, @version)
        end
        puts JSON.generate(exists)
      end

    end
  end
end
