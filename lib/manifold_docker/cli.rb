# frozen_string_literal: true

require 'thor'
require 'pry'

module ManifoldDocker
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'manifold_docker version'
    def version
      require_relative 'version'
      puts "v#{ManifoldDocker::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'push VERSION', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :username, type: :string, default: nil, desc: "Docker hub username"
    method_option :password, type: :string, default: nil, desc: "Docker hub password"
    def push(version)
      if options[:help]
        invoke :help, ['push']
      else
        require_relative 'commands/push'
        ManifoldDocker::Commands::Push.new(version, options).execute
      end
    end

    desc 'build [TAG]', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :no_overwrite, type: :boolean, default: false, desc: "If true, existing packages will be overwritten."
    method_option :not_interactive, type: :boolean, default: false, desc: "If true, user will not be prompted."
    def build(tag = nil)
      if options[:help]
        invoke :help, ['build']
      else
        require_relative 'commands/build'
        ManifoldDocker::Commands::Build.new(options).execute(tag)
      end
    end

    desc 'clean VERSION', 'Clean images for the given version'
    method_option :help, aliases: '-h', type: :boolean,
                  desc: 'Display usage information'
    def clean(version)
      if options[:help]
        invoke :help, ['clean']
      else
        require_relative 'commands/clean'
        ManifoldDocker::Commands::Clean.new(version, options).execute
      end
    end

    desc 'check VERSION', 'Check if images for a given version exist'
    method_option :help, aliases: '-h', type: :boolean,
                  desc: 'Display usage information'
    method_option :list_missing, type: :boolean, default: false, desc: "If true, list missing packages"
    def check(version)
      if options[:help]
        invoke :help, ['check']
      else
        require_relative 'commands/check'
        ManifoldDocker::Commands::Check.new(version, options).execute
      end
    end

  end
end
