require "test_helper"

describe Image do
  before do
    @image = Image.new
  end

  it "must be valid" do
    @image.valid?.must_equal true
  end
end
