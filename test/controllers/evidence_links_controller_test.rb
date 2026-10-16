require "test_helper"

class EvidenceLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence_link = evidence_links(:one)
  end

  test "should get index" do
    get evidence_links_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_link_url
    assert_response :success
  end

  test "should create evidence_link" do
    assert_difference("EvidenceLink.count") do
      post evidence_links_url, params: { evidence_link: { decision: @evidence_link.decision, note: @evidence_link.note, passage_id: @evidence_link.passage_id, question_id: @evidence_link.question_id } }
    end

    assert_redirected_to evidence_link_url(EvidenceLink.last)
  end

  test "should show evidence_link" do
    get evidence_link_url(@evidence_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_link_url(@evidence_link)
    assert_response :success
  end

  test "should update evidence_link" do
    patch evidence_link_url(@evidence_link), params: { evidence_link: { decision: @evidence_link.decision, note: @evidence_link.note, passage_id: @evidence_link.passage_id, question_id: @evidence_link.question_id } }
    assert_redirected_to evidence_link_url(@evidence_link)
  end

  test "should destroy evidence_link" do
    assert_difference("EvidenceLink.count", -1) do
      delete evidence_link_url(@evidence_link)
    end

    assert_redirected_to evidence_links_url
  end
end
