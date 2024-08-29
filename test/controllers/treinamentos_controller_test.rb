require "test_helper"

class TreinamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treinamento = treinamentos(:one)
  end

  test "should get index" do
    get treinamentos_url, as: :json
    assert_response :success
  end

  test "should create treinamento" do
    assert_difference("Treinamento.count") do
      post treinamentos_url, params: { treinamento: { autor_id: @treinamento.autor_id, capa: @treinamento.capa, categoria_id: @treinamento.categoria_id, corpo: @treinamento.corpo, data: @treinamento.data, destaqueHome: @treinamento.destaqueHome, resumo: @treinamento.resumo, tag_id: @treinamento.tag_id, titulo: @treinamento.titulo } }, as: :json
    end

    assert_response :created
  end

  test "should show treinamento" do
    get treinamento_url(@treinamento), as: :json
    assert_response :success
  end

  test "should update treinamento" do
    patch treinamento_url(@treinamento), params: { treinamento: { autor_id: @treinamento.autor_id, capa: @treinamento.capa, categoria_id: @treinamento.categoria_id, corpo: @treinamento.corpo, data: @treinamento.data, destaqueHome: @treinamento.destaqueHome, resumo: @treinamento.resumo, tag_id: @treinamento.tag_id, titulo: @treinamento.titulo } }, as: :json
    assert_response :success
  end

  test "should destroy treinamento" do
    assert_difference("Treinamento.count", -1) do
      delete treinamento_url(@treinamento), as: :json
    end

    assert_response :no_content
  end
end
