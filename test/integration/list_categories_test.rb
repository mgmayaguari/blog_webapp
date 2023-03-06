require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category_2 = Category.create(name: "Travel")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category_2), text: @category_2.name
  end
end