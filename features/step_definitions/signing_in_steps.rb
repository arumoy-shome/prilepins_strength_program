Given /^a user visits the sign in page$/ do
  visit signin_path
end

When /^they submit invalid credentials$/ do
  click_button "Sign In"
end

Then /^they should see an error message$/ do
  expect{page}.to have_selector{'div.alert.alert-error'}
end
