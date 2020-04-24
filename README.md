# Example repo to demonstrate database_cleaner issue 564

[Original issue comment](https://github.com/DatabaseCleaner/database_cleaner/issues/564#issuecomment-613334446)

I tried with sqlite to ease up the project setup, and I recreated the bug as well.
So it is not tied to mysql specifically

Setup:
* `bundle install`
* `bundle exec rails db:create db:migrate`
* `bundle exec rake db:test:prepare`
* `bundle exec rspec`

I put the failing test in "pending" state, so the command `rspec` is not failing.
We can see that the expected value is `!=0`, yet we got `0` in the test, as if the record was deleted

We can uncomment this code to make the test pass (so `rspec` will fail because it expects a pending test to fail)
```ruby
config.before(:suite) do
     DatabaseCleaner.strategy = :transaction
     DatabaseCleaner.clean_with(:truncation)
end
```

