Given /^I have credited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.credited(amount)
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

Then /^the balance is (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
	eventually {expect(my_account.balance).to eq(amount)}
end