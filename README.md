# RCrawler

[![Gem Version](https://badge.fury.io/rb/rcrawler.png)](http://badge.fury.io/rb/rcrawler)
[![Build Status](https://travis-ci.org/i2bskn/rcrawler.png?branch=master)](https://travis-ci.org/i2bskn/rcrawler)
[![Coverage Status](https://coveralls.io/repos/i2bskn/rcrawler/badge.png)](https://coveralls.io/r/i2bskn/rcrawler)
[![Code Climate](https://codeclimate.com/github/i2bskn/rcrawler.png)](https://codeclimate.com/github/i2bskn/rcrawler)

The wrapper of capybara for crawler.

## Dependencies

* nokogiri requires libxml2.
* capybara-webkit requires qt. [capybara-webkit wiki](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)

## Installation

Add this line to your application's Gemfile:

    gem 'rcrawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rcrawler

## Usage

#### Crawl

```ruby
require "rcrawler"

RCrawler.crawl do
  # Some capybara dsl
  visit("https://example.com/login")
  page.fill_in("name", with: "user")
  page.fill_in("password", with: "secret")
  page.click_button("send")
  page.save_screenshot("/tmp/example.png")

  # Screenshot shortcut
  # visit(arg[0]) and page.save_screenshot(arg[1])
  screenshot("http://example.com", "/tmp/example.png")

  # Nokogiri
  # doc is return Nokogiri::HTML(page.html)
  visit("http://example.com")
  doc.css("a.some_link").each {|a| puts a.attr("href")}
end
```

#### Configuration

```ruby
RCrawler.configure do |c|
  c.threads = 10 # => default is 8
  c.timeout = 20 # => default is 10
  c.timeout_proc = :ignore # => default is :raise
end
```

#### Async processing

```ruby
RCrawler.async do
  crawl do
    # do something
  end

  crawl do
    # do something
  end

  crawl do
    # do something
  end
end
```

#### Command

    % rcrawler help
    Commands:
      rcrawler help [COMMAND]         # Describe available commands or one specific command
      rcrawler sc http://example.com  # Get screen shot

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
