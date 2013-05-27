# Dashing MTA

A simple [Dashing](https://github.com/Shopify/dashing) widget to show the
status of the New York subway.

## Installation

Clone this repo and copy the files under ```job``` and ```widget``` into your
dashboard repo, add nokogiri and httparty to your dashing repo's Gemfile and
you're done.

## Usage

To include the widgets in a dashboard, add the following snippet to the
appropriate dashboard:

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="mta" data-view="Mta"></div>
</li>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Dashing MTA is released under the MIT license.
