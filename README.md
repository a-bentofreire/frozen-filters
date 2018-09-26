## Description
  
Liquid filters for shopify [liquid](https://github.com/shopify/liquid) template engine.  
This gem is a port of [frozen-filters-js](https://github.com/a-bentofreire/frozen-filters-js).

<!-- ## Installation
`gem install frozen-filters`  
 -->
## Usage
```ruby
require 'liquid'
require 'frozen-filters'

vars = {
  'url' => 'http://www.example.com/first/second/index.html?param1=value1&param2=value2'
}

@template = Liquid::Template.parse('{{ url | remove_ext }}')
@template.render(vars)  # http://www.example.com/first/second/index?param1=value1&param2=value2
```

## Filters
  
- `remove_ext` - Removes the extension part of an url.   
e.g. `http://www.example.com/first/second/index?param1=value1&param2=value2`.
  
- `remove_qs` - Removes the query string part of an url. e.g. `http://www.example.com/first/second/index.html`.
- `extract_basename` - Returns the basename of an url. e.g. `index.html`.
- `extract_dirname` - Returns the dirname of an url. e.g. `first/second`.
- `extract_protocol` - Returns the protocol. e.g. `http`.
  
## Internationalization
  
The url filters support domains and paths with non-latin characters.  
e.g. `http://吃.高雄/第一/第二/首頁.html?param1=value1&param2=value2`.
  
## Copyrights
  
© 2018 [Alexandre Bento Freire](https://www.a-bentofreire.com)  
  
  
## License
  
[MIT License+uuid License](https://github.com/a-bentofreire/uuid-licenses/blob/master/MIT-uuid-license.md)  
