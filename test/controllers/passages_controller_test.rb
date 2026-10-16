require "test_helper"

class PassagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passage = passages(:one)
  end

  test "should get index" do
    get passages_url
    assert_response :success
  end

  test "should get new" do
    get new_passage_url
    assert_response :success
  end

  test "should create passage" do
    assert_difference("Passage.count") do
      post passages_url, params: { passage: { body: @passage.body, heading_path: @passage.heading_path, page_index: @passage.page_index, paragraph_index: @passage.paragraph_index, source_id: @passage.source_id } }
    end

    assert_redirected_to passage_url(Passage.last)
  end

  test "should show passage" do
    get passage_url(@passage)
    assert_response :success
  end

  test "should get edit" do
    get edit_passage_url(@passage)
    assert_response :success
  end

  test "should update passage" do
    patch passage_url(@passage), params: { passage: { body: @passage.body, heading_path: @passage.heading_path, page_index: @passage.page_index, paragraph_index: @passage.paragraph_index, source_id: @passage.source_id } }
    assert_redirected_to passage_url(@passage)
  end

  test "should destroy passage" do
    assert_difference("Passage.count", -1) do
      delete passage_url(@passage)
    end

    assert_redirected_to passages_url
  end
end
