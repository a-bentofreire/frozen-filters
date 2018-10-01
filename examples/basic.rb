require 'liquid'
require 'frozen-filters'

vars = {
  'url' => 'http://www.example.com/first/second/index.html?param1=value1&param2=value2'
}

@template = Liquid::Template.parse('{{ url | remove_ext }}')
puts @template.render(vars) # http://www.example.com/first/second/index?param1=value1&param2=value2
