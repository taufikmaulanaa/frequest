# frequest

TODO: Write a description here

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     frequest:
       github: taufikmaulanaa/frequest
   ```

2. Run `shards install`

## Usage

```crystal
require "frequest"
```

Cara membuat request
```crystal
begin
  response = Frequest.new(
    method: "GET",
    url: "http://api.id/test",
    body: URI::Params.encode({ "username" => username }),
    headers: HTTP::Headers{ "username" => "X" }
  )
  response
rescue exception
  puts "error : #{exception.message})"
end
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/taufikmaulanaa/frequest/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Taufik](https://github.com/taufikmaulanaa) - creator and maintainer
