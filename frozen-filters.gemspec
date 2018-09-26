# uuid: 253ed382-5ba3-4af9-9daf-d4210baf26e6

# ------------------------------------------------------------------------
# Copyright (c) 2018 Alexandre Bento Freire. All rights reserved.
# Licensed under the MIT License+uuid License. See License.txt for details
# ------------------------------------------------------------------------

Gem::Specification.new do |s|
  s.name        = 'frozen-filters'
  s.version     = '0.1.0'
  s.date        = '2018-09-26'
  s.summary     = "Liquid filters for shopify template engine"
  s.authors     = ["Alexandre Bento Freire"]
  s.email       = 'devpieces@a-bentofreire.com'
  s.files       = ["lib/frozen-filters.rb"]
  s.license     = 'MIT+uuid'
  s.homepage    = 'https://github.com/a-bentofreire/frozen-filters'
  s.add_runtime_dependency('liquid', ['~> 4.0'])
end