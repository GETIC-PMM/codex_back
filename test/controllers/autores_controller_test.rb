require "test_helper"

class AutoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autor = autores(:one)
  end

  test "should get index" do
    get autores_url, as: :json
    assert_response :success
  end

  test "should create autor" do
    assert_difference("Autor.count") do
      post autores_url, params: { autor: { foto: @autor.foto, nome: @autor.nome } }, as: :json
    end

    assert_response :created
  end

  test "should show autor" do
    get autor_url(@autor), as: :json
    assert_response :success
  end

  test "should update autor" do
    patch autor_url(@autor), params: { autor: { foto: @autor.foto, nome: @autor.nome } }, as: :json
    assert_response :success
  end

  test "should destroy autor" do
    assert_difference("Autor.count", -1) do
      delete autor_url(@autor), as: :json
    end

    assert_response :no_content
  end
end
