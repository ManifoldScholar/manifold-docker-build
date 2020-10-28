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
        image_names.each do |image|
          name = versioned_image(image, @version)
          puts "Pushing image #{name}"
          exe = "docker push #{name}"
          out, err = cmd.run(exe)
        end
      end
    end
  end
end
