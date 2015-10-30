require 'pry'
require_relative 'spec_helper'

describe View do
  let (:view) { View.new }

  it "is a new instance of View class" do
    expect(view.class).to eq(View)
  end

  it "is instaniated with standard input" do
    expect(view.input.class).to eq(IO)
  end

  it "is instaniated with standard output" do
    expect(view.output.class).to eq(IO)
  end

  it "can read and write to its input" do
    view.input = "Hello, world."
    expect(view.input).to eq("Hello, world.")
  end

  it "can read and write to its output" do
    view.output = "Hello, world."
    expect(view.output).to eq("Hello, world.")
  end

  it "can send a welcome message to standard out" do
    expect{view.welcome_message}.to output.to_stdout
  end

  it "can send clearing string to standard out" do
    expect{view.clear}.to output.to_stdout
  end

  it "can send a unique message to standard out" do
    view.output = "Hello, world."
    expect{puts view.output}.to output.to_stdout
    expect(view.output).to eq("Hello, world.")
  end

  it "can send a message with #display" do
    expect{view.display("Hello, world.")}.to output.to_stdout
  end

  it "can recieve a message from standard in" do
    $stdin = "Hello"
    expect(view).to respond_to(:prompt)
    expect(view.input).to eq("Hello")
  end

end