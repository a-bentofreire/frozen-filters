# uuid: 705d8f39-63cf-4b12-af68-36c2ed42fd34

# ------------------------------------------------------------------------
# Copyright (c) 2018 Alexandre Bento Freire. All rights reserved.
# Licensed under the MIT License+uuid License. See License.txt for details
# ------------------------------------------------------------------------

require 'liquid'

module FrozenFilters
  # Removes the extension part of an url.
  # e.g. `http://www.example.com/first/second/index?param1=value1&param2=value2`.
  def remove_ext(input)
    input.to_s.gsub(/\.[^\.\?]+(\?[^\?]*)?$/, '\1')
  end

  # Removes the query string part of an url. e.g. `http://www.example.com/first/second/index.html`.
  def remove_qs(input)
    input.to_s.gsub(/\?[^\?]+$/, '')
  end

  # Returns the basename of an url. e.g. `index.html`.
  def extract_basename(input)
    input.to_s.gsub(/^.*\/([^\/\?]+).*$/, '\1')
  end

  # Returns the dirname of an url. e.g. `/first/second`.
  def extract_dirname(input)
    result = extract_path(input).gsub(/\/[^\/]+$/, '')
    result != '' ? result : '/'
  end

  # Returns the path of an url. e.g. `/first/second/index.html`.
  def extract_path(input)
    input_s = input.to_s
    if /^(\w+):/.match(input_s)
      input_s.gsub(/^\w+:[^\/]*\/\/[^\/]+(\/[^\?]+)(?:\?.*)?$/, '\1')
    else
      input_s.gsub(/(?:\?.*)$/, '')
    end
  end

  # Returns the protocol. e.g. `http`.
  def extract_protocol(input)
    matches = input.to_s.match(/^(\w+):/)
    matches ? matches[1] : ''
  end

  # Returns the query string part. e.g. `param1=value1&param2=value2`.
  def extract_qs(input)
    input.to_s.gsub(/^[^\?]*\??/, '\1')
  end

  # Returns the first N elements of an array.
  # e.g. `{{ ["first","second","third"] | array_head: 2 }}` =~ `["first","second"]`.
  # If the number of parameters is negative it returns an empty array.
  # The the input isn't an array it returns the untouched input.
  def array_head(input, p)
    input.is_a?(Array) ? input.take([0, p.to_i].max) : input
  end

  # Returns the last N elements of an array.
  # e.g. `{{ ["first","second","third"] | array_tail: 2 }}` =~ `["second","third"]`.
  # If the number of parameters is negative it returns an empty array.
  # The the input isn't an array it returns the untouched input.
  def array_tail(input, p)
    input.is_a?(Array) ? input.drop([0, input.length - p.to_i].max) : input
  end

  # Transforms an array into an enclose html tag list separated by newline.
  # e.g. `{{ ["first","second" | array_to_taglist: "li" }}` =~
  # ```html
  # <li>first</li>
  # <li>second</li>
  # ```
  # The the input isn't an array it returns the untouched input.
  def array_to_taglist(input, p)
    if input.is_a?(Array) && p.is_a?(String)
      startTag = '<' + p + '>'
      endTag = '</' + p + '>'
      !input.empty? ? startTag + input.join(endTag + "\n" + startTag) + endTag : ''
    else
      input
    end
  end
end

Liquid::Template.register_filter(FrozenFilters)
