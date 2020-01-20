install:
	bundle install

start:
	rackup

# test:
# 	ruby test/test_app.rb

lint:
	bundle exec rubocop

.PHONY: test
