task default: %w[test]

task :test do
  Dir.chdir('test')
  sh 'ruby tests.rb'
end

task :list_gems do
  gems = Dir.glob('*.gem')
  gems = gems.sort
  puts gems.join("\n")
end

task :list_gems do
  gems = Dir.glob('*.gem')
  gems = gems.sort
  puts gems.join("\n")
end

task :build_gem do
  sh 'gem build frozen-filters.gemspec'
end

task :publish do
  sh 'gem build frozen-filters.gemspec'
  gems = Dir.glob('*.gem')
  gems = gems.sort
  puts ""
  puts "------------- Execute ------------"
  puts "gem push " + gems.last
end
