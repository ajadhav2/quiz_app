require 'test_helper'

class AnswerTriviaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get answer_trivia_index_url
    assert_response :success
  end

end
