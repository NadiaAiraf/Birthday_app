def visit_home_enter_name
  visit('/')
  fill_in 'fname', with: 'aidan'
end
