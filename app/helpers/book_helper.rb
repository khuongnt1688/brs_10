module BookHelper
  def new_or_edit_book_book_state_path book, book_state
    book_state.nil? ? new_book_book_state_path(book, book_state) :
                      edit_book_book_state_path(book, book_state)
  end
end