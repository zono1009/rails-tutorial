require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    20.times do |i|
      Book.create(title: "Book #{i}", author: "Author #{i}", description: "Description #{i}")
    end

    get books_url
    assert_response :success

    # レスポンスの内容を解析
    books = assigns(:books) # コントローラーで設定されたインスタンス変数 @books を取得

    # 取得件数が20件であることを確認
    assert_equal 20, books.size

    # author順にソートされていることを確認
    authors = books.map(&:author)
    assert_equal authors, authors.sort
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, description: @book.description, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
