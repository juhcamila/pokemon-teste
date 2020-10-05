require 'test_helper'

class TimeTreinadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_treinador = time_treinadors(:one)
  end

  test "should get index" do
    get time_treinadors_url
    assert_response :success
  end

  test "should get new" do
    get new_time_treinador_url
    assert_response :success
  end

  test "should create time_treinador" do
    assert_difference('TimeTreinador.count') do
      post time_treinadors_url, params: { time_treinador: { nome: @time_treinador.nome, treinador_id_id: @time_treinador.treinador_id_id } }
    end

    assert_redirected_to time_treinador_url(TimeTreinador.last)
  end

  test "should show time_treinador" do
    get time_treinador_url(@time_treinador)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_treinador_url(@time_treinador)
    assert_response :success
  end

  test "should update time_treinador" do
    patch time_treinador_url(@time_treinador), params: { time_treinador: { nome: @time_treinador.nome, treinador_id_id: @time_treinador.treinador_id_id } }
    assert_redirected_to time_treinador_url(@time_treinador)
  end

  test "should destroy time_treinador" do
    assert_difference('TimeTreinador.count', -1) do
      delete time_treinador_url(@time_treinador)
    end

    assert_redirected_to time_treinadors_url
  end
end
