require 'test_helper'

class SnippetsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Snippet.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Snippet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Snippet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to snippet_url(assigns(:snippet))
  end
  
  def test_edit
    get :edit, :id => Snippet.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Snippet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Snippet.first
    assert_template 'edit'
  end

  def test_update_valid
    Snippet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Snippet.first
    assert_redirected_to snippet_url(assigns(:snippet))
  end
  
  def test_destroy
    snippet = Snippet.first
    delete :destroy, :id => snippet
    assert_redirected_to snippets_url
    assert !Snippet.exists?(snippet.id)
  end
end
