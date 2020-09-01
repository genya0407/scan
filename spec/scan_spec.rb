require 'spec_helper'

RSpec.describe Scan do
  it "has a version number" do
    expect(Scan::VERSION).not_to be nil
  end
end
