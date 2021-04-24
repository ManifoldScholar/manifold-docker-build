# frozen_string_literal: true
require "pathname"
require "tty-command"
require_relative '../command'
require_relative './base'
require "tty-prompt"

module ManifoldDocker
  module Commands
    class Build < Base

      def execute(tag, input: $stdin, output: $stdout)
        existing = existing_images
        overwrite = []

        unless @options[:no_overwrite]
          unless existing.empty?
            existing.each do |image|
              overwrite << image && next if @options[:not_interactive]
              overwrite << image if prompt.yes?("#{image} exists. Overwrite?")
            end
          end
        end

        image_names.each do |image|
          if existing.include? image
            puts "Skipping image: #{image}." && next unless overwrite.include? image
            puts "Deleting image: #{image}"
            clean_image(image, tag)
          end
          puts "Creating image: #{image}..."
          create_image(image, tag)
        end
      end

    end
  end
end
