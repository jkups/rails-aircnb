require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Address", with: @property.address
    fill_in "Bathrooms", with: @property.bathrooms
    fill_in "Bedrooms", with: @property.bedrooms
    fill_in "Cleaning fee", with: @property.cleaning_fee
    fill_in "Description", with: @property.description
    fill_in "Heading", with: @property.heading
    fill_in "Latitude", with: @property.latitude
    fill_in "Longitude", with: @property.longitude
    fill_in "Max guests", with: @property.max_guests
    fill_in "Service fee", with: @property.service_fee
    fill_in "Title", with: @property.title
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Address", with: @property.address
    fill_in "Bathrooms", with: @property.bathrooms
    fill_in "Bedrooms", with: @property.bedrooms
    fill_in "Cleaning fee", with: @property.cleaning_fee
    fill_in "Description", with: @property.description
    fill_in "Heading", with: @property.heading
    fill_in "Latitude", with: @property.latitude
    fill_in "Longitude", with: @property.longitude
    fill_in "Max guests", with: @property.max_guests
    fill_in "Service fee", with: @property.service_fee
    fill_in "Title", with: @property.title
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end
