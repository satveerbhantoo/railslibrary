require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # include Devise::TestHelpers

  test "true" do
    assert true
  end

  test "should not save libraries without name" do
    library = Library.new
    assert_not library.save, "Saved library without a name"
  end

  test "name should be more than 4 chars" do 
    library = Library.new(name: 'asd')
    assert_not library.save, "Saved library with less than 4 chars"
  end
end
