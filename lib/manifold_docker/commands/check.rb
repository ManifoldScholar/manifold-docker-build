# frozen_string_literal: true
require "pathname"
require "tty-command"
require "json"
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
        missing = []
        image_names.each do |image|
          missing << versioned_image(image, @version) unless image_exists?(image, @version)
        end
        exists = missing.empty?
        if @options[:list_missing]
          puts JSON.generate(missing)
        else
          puts JSON.generate(exists)
        end
      end

    end
  end
end
