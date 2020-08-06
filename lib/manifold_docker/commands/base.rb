# frozen_string_literal: true
require "pathname"
require "tty-command"
require_relative '../command'

module ManifoldDocker
  module Commands
    class Base < ManifoldDocker::Command

      ROOT = File.expand_path('../../..', __dir__)

      def initialize(options)
        @options = options
      end

      private

      def cmd(printer = :null)
        TTY::Command.new(printer: printer)
      end

      def existing_images
        image_names.select do |image|
          image_exists?(image)
        end
      end

      def clean_image(image, the_version = default_version)
        out, err = cmd.run("docker image rm #{versioned_image(image, the_version)}")
      end

      def create_image(image, the_version = default_version)
        exe = "docker build --no-cache --build-arg MANIFOLD_VERSION=#{the_version} -t #{versioned_image(image, the_version)} -f ./dockerfiles/#{image}/Dockerfile ."
        out, err = cmd(:pretty).run(exe)
      end

      def push_image(image, the_version = default_version)
        exe = "docker push #{versioned_image(image, the_version)}"
        out, err = cmd(:pretty).run(exe)
      end

      def login(username, password)
        exe = "docker login -u #{username} -p #{password}"
        out, err = cmd(:pretty).run(exe)
      end

      def image_exists?(image, the_version = default_version)
        out, err = cmd.run("docker image ls #{versioned_image(image, the_version)} -q")
        res = !out.empty?
        res
      end

      def versioned_image(image, the_version = default_version)
        "manifoldscholar/#{image}:#{the_version}"
      end

      def image_names
        dirs = Pathname.new(File.join(ROOT, "dockerfiles")).children.select { |c| c.directory? }
        images = dirs.map { |d| File.basename(d) }
        # We always need to build the base image first.
        images.rotate(images.find_index("manifold_api_base"))
      end

      def default_version
        path = "MANIFOLD_VERSION"
        found = File.join ROOT, path
        raise "Cannot find version file: #{path}" unless File.exist?(found)
        File.read(found).strip.tap do |contents|
          raise "Empty file" if contents.empty?
        end
      end
    end
  end
end
