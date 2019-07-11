require 'capybara/cucumber'
require 'capybara/cuprite'

Capybara.run_server = false
Capybara.default_driver = :cuprite
Capybara.javascript_driver = :cuprite
Capybara.app_host = "http://localhost:3000"
Capybara.default_max_wait_time = 10

# Conditions
<<<<<<< HEAD

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> bebe38d117566fdca489d8855a56aacf4c85e3cb
Soit("{string} l'item affiché") do |item|
  click_on item
end

Soit("l'attribut {string} n'existant pas dans la liste des attributs de l'item {string}") do |attribut, item|
  # On the remote servers
end
# -----


# Events
Quand("on choisit la rubrique {string}") do |topic|
  click_on topic
end

Quand("on ajoute un attribut {string} et la valeur {string}") do |attribut, value|
  find_button('Ajouter un attribut').click
    fill_in "#key", with: attribut

    fill_in "#value", with: value

  find_button('Valider').click
end
# -----


# Outcomes
Alors("le titre de l'item affiché est {string}") do |item|
  expect(find(".Subject h2")).to have_content(item)
end

Alors("la valeur de l'attribut {string} est {string}") do |attribute, value|
  expect(page).to have_content(value)
  expect(page).to have_content(attribute)
end


Alors("une des rubriques de l'item est {string}") do |topic|
  expect(page).to have_content(topic)
end
<<<<<<< HEAD

=======
=======
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
Soit("l‘item affiché {string}") do |item|
  visit "/"
  expect(page).to have_content(item)
  click_on(item)
end


# Events

Quand("un visiteur clique sur le thème {string}") do |topic|
  click_on(topic)
end

# Outcomes
<<<<<<< HEAD
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
=======
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
=======
# -----
>>>>>>> bebe38d117566fdca489d8855a56aacf4c85e3cb
