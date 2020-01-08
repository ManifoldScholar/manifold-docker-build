RSpec.describe "`manifold_docker push` command", type: :cli do
  it "executes `manifold_docker help push` command successfully" do
    output = `manifold_docker help push`
    expected_output = <<-OUT
Usage:
  manifold_docker push

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
