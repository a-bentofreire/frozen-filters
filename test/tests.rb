# uuid: 0de3b355-8ca5-41b9-b7de-1574799c3d24

# ------------------------------------------------------------------------
# Copyright (c) 2018 Alexandre Bento Freire. All rights reserved.
# Licensed under the MIT License+uuid License. See License.txt for details
# ------------------------------------------------------------------------

require 'liquid'
require 'json'
require_relative '../lib/frozen-filters.rb'

file = File.read('./config.json')
cfg = JSON.parse(file)
vars = cfg['vars']

groups = cfg['tests']

groups.keys.each{ |groupName|
   group = groups[groupName]
   puts 'Group: ' + groupName

   group.keys.each{ |testName|
    test = group[testName]
    puts '--Test: ' + testName

    test.each{ |caseObj|
      enabled = caseObj['enabled']
      if enabled != false
        src = caseObj['src']
        expected = caseObj['result']
        puts "- - - " + src + "=" + expected
        @template = Liquid::Template.parse(src)  # Parses and compiles the template
        result = @template.render(vars)
        puts "-- -- -- " + result
        if expected != result
          puts 'FAILED'
          throw 'FAILED: Group: `' + groupName + '` Test: `' + testName + '` src: `' + src + '`'
        end
        puts ''
      end
    }
  }
}
