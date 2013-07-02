# Rcrawler

The wrapper of capybara for crawler.

## Installation

Add this line to your application's Gemfile:

    gem 'rcrawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rcrawler

## Usage

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
