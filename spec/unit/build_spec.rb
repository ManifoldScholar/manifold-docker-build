require 'manifold_docker/commands/build'

RSpec.describe ManifoldDocker::Commands::Build do
  it "executes `build` command successfully" do
    output = StringIO.new
    options = {}
    command = ManifoldDocker::Commands::Build.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
