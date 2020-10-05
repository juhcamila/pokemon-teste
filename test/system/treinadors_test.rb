require "application_system_test_case"

class TreinadorsTest < ApplicationSystemTestCase
  setup do
    @treinador = treinadors(:one)
  end

  test "visiting the index" do
    visit treinadors_url
    assert_selector "h1", text: "Treinadors"
  end

  test "creating a Treinador" do
    visit treinadors_url
    click_on "New Treinador"

    fill_in "Idade", with: @treinador.idade
    fill_in "Nome", with: @treinador.nome
    fill_in "Sexo", with: @treinador.sexo
    click_on "Create Treinador"

    assert_text "Treinador was successfully created"
    click_on "Back"
  end

  test "updating a Treinador" do
    visit treinadors_url
    click_on "Edit", match: :first

    fill_in "Idade", with: @treinador.idade
    fill_in "Nome", with: @treinador.nome
    fill_in "Sexo", with: @treinador.sexo
    click_on "Update Treinador"

    assert_text "Treinador was successfully updated"
    click_on "Back"
  end

  test "destroying a Treinador" do
    visit treinadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treinador was successfully destroyed"
  end
end
