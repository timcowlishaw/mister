Given /^I am running a single\-machine mister cluster$/ do
  run_simple("mister manager 127.0.0.1")
  run_simple("mister worker 127.0.0.1")
end

Given /^the file "(.*?)" contains the following data$/ do |arg1, string|
  pending # express the regexp above with the code you wish you had
end

Given /^I have uploaded the file "(.*?)" to the cluster$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I have a job called "(.*?)" with the source$/ do |arg1, string|
  pending # express the regexp above with the code you wish you had
end

When /^I run the job "(.*?)" on the file "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When /^I download the file "(.*?)" from the cluster$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the following data in the output file "(.*?)"$/ do |arg1, table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
