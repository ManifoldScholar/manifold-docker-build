require 'manifold_docker/commands/push'

RSpec.describe ManifoldDocker::Commands::Push do
  it "executes `push` command successfully" do
    output = StringIO.new
    options = {}
    command = ManifoldDocker::Commands::Push.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
