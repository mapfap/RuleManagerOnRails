require 'test_helper'

class ChangelogsControllerTest < ActionController::TestCase
  setup do
    @changelog = changelogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:changelogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create changelog" do
    assert_difference('Changelog.count') do
      post :create, changelog: { ip: @changelog.ip, new_if: @changelog.new_if, new_tag: @changelog.new_tag, new_then: @changelog.new_then, rule: @changelog.rule, timestamp: @changelog.timestamp, user: @changelog.user }
    end

    assert_redirected_to changelog_path(assigns(:changelog))
  end

  test "should show changelog" do
    get :show, id: @changelog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @changelog
    assert_response :success
  end

  test "should update changelog" do
    patch :update, id: @changelog, changelog: { ip: @changelog.ip, new_if: @changelog.new_if, new_tag: @changelog.new_tag, new_then: @changelog.new_then, rule: @changelog.rule, timestamp: @changelog.timestamp, user: @changelog.user }
    assert_redirected_to changelog_path(assigns(:changelog))
  end

  test "should destroy changelog" do
    assert_difference('Changelog.count', -1) do
      delete :destroy, id: @changelog
    end

    assert_redirected_to changelogs_path
  end
end
