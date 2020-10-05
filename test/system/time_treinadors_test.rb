require "application_system_test_case"

class TimeTreinadorsTest < ApplicationSystemTestCase
  setup do
    @time_treinador = time_treinadors(:one)
  end

  test "visiting the index" do
    visit time_treinadors_url
    assert_selector "h1", text: "Time Treinadors"
  end

  test "creating a Time treinador" do
    visit time_treinadors_url
    click_on "New Time Treinador"

    fill_in "Nome", with: @time_treinador.nome
    fill_in "Treinador id", with: @time_treinador.treinador_id_id
    click_on "Create Time treinador"

    assert_text "Time treinador was successfully created"
    click_on "Back"
  end

  test "updating a Time treinador" do
    visit time_treinadors_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @time_treinador.nome
    fill_in "Treinador id", with: @time_treinador.treinador_id_id
    click_on "Update Time treinador"

    assert_text "Time treinador was successfully updated"
    click_on "Back"
  end

  test "destroying a Time treinador" do
    visit time_treinadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time treinador was successfully destroyed"
  end
end
