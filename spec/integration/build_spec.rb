RSpec.describe "`manifold_docker build` command", type: :cli do
  it "executes `manifold_docker help build` command successfully" do
    output = `manifold_docker help build`
    expected_output = <<-OUT
Usage:
  manifold_docker build

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
