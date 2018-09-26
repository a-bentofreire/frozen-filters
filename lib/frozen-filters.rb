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

  # Returns the dirname of an url. e.g. `first/second`.
  def extract_dirname(input)
    input_s = input.to_s
    if /^(\w+):/.match(input_s)
      input_s.gsub(/^\w+:[^\/]*\/\/[^\/]+(\/[^\?]+)\/.*$/, '\1')
    else
      input_s.gsub(/\/[^\/]+$/, '')
    end
  end

  # Returns the protocol. e.g. `http`.
  def extract_protocol(input)
    matches = input.to_s.match(/^(\w+):/)
    if matches
      matches[1]
    else
      ""
    end
  end
end

Liquid::Template.register_filter(FrozenFilters)
