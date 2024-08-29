# frozen_string_literal: true

require "test_helper"

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria = categorias(:one)
  end

  test "should get index" do
    get categorias_url, as: :json
    assert_response :success
  end

  test "should create categoria" do
    assert_difference("Categoria.count") do
      post categorias_url, params: {categoria: {titulo: @categoria.titulo}}, as: :json
    end

    assert_response :created
  end

  test "should show categoria" do
    get categoria_url(@categoria), as: :json
    assert_response :success
  end

  test "should update categoria" do
    patch categoria_url(@categoria), params: {categoria: {titulo: @categoria.titulo}}, as: :json
    assert_response :success
  end

  test "should destroy categoria" do
    assert_difference("Categoria.count", -1) do
      delete categoria_url(@categoria), as: :json
    end

    assert_response :no_content
  end
end
