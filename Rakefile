#!/usr/bin/env rake

task :ci => [:dump, :test]

task :dump do
  sh 'vim --version'
end

task :test do
  sh 'export PATH="$PWD/t:$PATH";bundle exec vim-flavor test'
end
