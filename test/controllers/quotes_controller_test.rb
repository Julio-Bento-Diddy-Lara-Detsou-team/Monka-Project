require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { amount: @quote.amount, customer_id: @quote.customer_id, discount: @quote.discount, invoice_number: @quote.invoice_number, invoice_sending_counter: @quote.invoice_sending_counter, invoice_sending_date: @quote.invoice_sending_date, is_invoice: @quote.is_invoice, is_paid: @quote.is_paid, quote_number: @quote.quote_number, quote_sending_counter: @quote.quote_sending_counter, quote_sending_date: @quote.quote_sending_date, user_id: @quote.user_id } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { amount: @quote.amount, customer_id: @quote.customer_id, discount: @quote.discount, invoice_number: @quote.invoice_number, invoice_sending_counter: @quote.invoice_sending_counter, invoice_sending_date: @quote.invoice_sending_date, is_invoice: @quote.is_invoice, is_paid: @quote.is_paid, quote_number: @quote.quote_number, quote_sending_counter: @quote.quote_sending_counter, quote_sending_date: @quote.quote_sending_date, user_id: @quote.user_id } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
