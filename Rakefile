require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Realizar pruebas de la clase EtiquetaNutricional"
task :spec do
    sh "rspec -I spec/EtiquetaNutricional_spec.rb"
end
