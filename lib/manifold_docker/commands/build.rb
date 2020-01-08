# frozen_string_literal: true
require "pathname"
require "tty-command"
require_relative '../command'
require_relative './base'
require "tty-prompt"

module ManifoldDocker
  module Commands
    class Build < Base

      def execute(input: $stdin, output: $stdout)
        existing = existing_images
        overwrite = []

        unless @options[:no_overwrite]
          unless existing.empty?
            existing.each do |image|
              overwrite << image unless prompt.no?("#{image} exists. Overwrite?")
            end
          end
        end

        image_names.each do |image|
          if existing.include? image
            puts "Skipping image: #{image}." && next unless overwrite.include? image
            puts "Deleting image: #{image}"
            clean_image(image)
          end
          puts "Creating image: #{image}..."
          create_image(image)
        end
      end

    end
  end
end
