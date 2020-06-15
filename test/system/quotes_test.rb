require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Amount", with: @quote.amount
    fill_in "Customer", with: @quote.customer_id
    fill_in "Discount", with: @quote.discount
    fill_in "Invoice number", with: @quote.invoice_number
    fill_in "Invoice sending counter", with: @quote.invoice_sending_counter
    fill_in "Invoice sending date", with: @quote.invoice_sending_date
    fill_in "Is invoice", with: @quote.is_invoice
    fill_in "Is paid", with: @quote.is_paid
    fill_in "Quote number", with: @quote.quote_number
    fill_in "Quote sending counter", with: @quote.quote_sending_counter
    fill_in "Quote sending date", with: @quote.quote_sending_date
    fill_in "User", with: @quote.user_id
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @quote.amount
    fill_in "Customer", with: @quote.customer_id
    fill_in "Discount", with: @quote.discount
    fill_in "Invoice number", with: @quote.invoice_number
    fill_in "Invoice sending counter", with: @quote.invoice_sending_counter
    fill_in "Invoice sending date", with: @quote.invoice_sending_date
    fill_in "Is invoice", with: @quote.is_invoice
    fill_in "Is paid", with: @quote.is_paid
    fill_in "Quote number", with: @quote.quote_number
    fill_in "Quote sending counter", with: @quote.quote_sending_counter
    fill_in "Quote sending date", with: @quote.quote_sending_date
    fill_in "User", with: @quote.user_id
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
