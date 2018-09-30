## Description
[![Gem Version](https://badge.fury.io/rb/frozen-filters.svg)](https://badge.fury.io/rb/frozen-filters)
[![Build Status](https://travis-ci.org/a-bentofreire/frozen-filters.svg?branch=master)](https://travis-ci.org/a-bentofreire/frozen-filters)  
  
Liquid filters for shopify [liquid](https://github.com/shopify/liquid) template engine.  
This ruby gem is a port of [frozen-filters-js](https://github.com/a-bentofreire/frozen-filters-js).

## Installation
`gem install frozen-filters`  

## Usage
  
Usage outside `jekyllrb`:  
  
```ruby
require 'liquid'
require 'frozen-filters'

vars = {
  'url' => 'http://www.example.com/first/second/index.html?param1=value1&param2=value2'
}

@template = Liquid::Template.parse('{{ url | remove_ext }}')
@template.render(vars)  # http://www.example.com/first/second/index?param1=value1&param2=value2
```
  
Usage within `jekyllrb`:  
  
- Add to blog `Gemfile`: 
```ruby
gem "frozen-filters", "~> 0.3.0"
```
- Add to `plugins` section of blog `_config.yml`: 
```ruby
  - frozen-filters
```
- Use the filters on any liquid page.
e.g.
```html
{{ "/assets/main.css" | remove_ext }}
```

## Filters
### Url Filters
  
- `remove_ext` - Removes the extension part of an url.   
e.g. `http://www.example.com/first/second/index?param1=value1&param2=value2`.
  
- `remove_qs` - Removes the query string part of an url. e.g. `http://www.example.com/first/second/index.html`.
- `extract_basename` - Returns the basename of an url. e.g. `index.html`.
- `extract_dirname` - Returns the dirname of an url. e.g. `/first/second`.
- `extract_path` - Returns the path of an url. e.g. `/first/second/index.html`.
- `extract_protocol` - Returns the protocol. e.g. `http`.
- `extract_qs` - Returns the query string. e.g. `param1=value1&param2=value2`.
  
### Array Filters
  
- `array_head` - Returns the first `N` elements of an array.  
 e.g. `{{ ["first","second","third"] | array_head: 2 }}` =~ `["first","second"]`.  
 If the number of parameters is negative it returns an empty array.  
 The the input isn't an array it returns the untouched input.  
  
- `array_tail` - Returns the last `N` elements of an array.  
 e.g. `{{ ["first","second","third"] | array_tail: 2 }}` =~ `["first","second"]`.  
 If the number of parameters is negative it returns an empty array.  
 The the input isn't an array it returns the untouched input.  
- `array_to_taglist` - Transforms an array into an enclosed html tag list separated by newline.  
 e.g. `{{ ["first","second" | array_to_taglist: "li" }}`  returns:  
```html
<li>first</li>
<li>second</li>
```
  
If the input isn't an array, it returns the untouched input.
  
## Internationalization
  
The url filters support domains and paths with:
- non-latin characters.  
e.g. `http://吃.高雄/第一/第二/首頁.html?param1=value1&param2=value2`.  
- punycodes:  
e.g. `https://xn--jp-cd2fp15c.xn--fsq.jp/abc/index.html?param1=value1&param2=value2`.  
  
## Copyrights
  
© 2018 [Alexandre Bento Freire](https://www.a-bentofreire.com)  
  
  
## License
  
[MIT License+uuid License](https://github.com/a-bentofreire/uuid-licenses/blob/master/MIT-uuid-license.md)  
