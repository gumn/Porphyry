require 'capybara/cucumber'
require 'selenium/webdriver'

Capybara.run_server = false
Capybara.default_driver = :selenium_chrome_headless
Capybara.app_host = "http://localhost:3000"
Capybara.default_max_wait_time = 10

# Conditions

<<<<<<< HEAD
<<<<<<< HEAD
Soit("{string} l'item affiché") do |item|
  click_on item
end

# Events

Quand("on choisit la rubrique {string}") do |topic|
  click_on topic
end

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
