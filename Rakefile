require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Realizar pruebas de la clase Persona"
task :persona do
    sh "rspec spec/Persona_spec.rb"
end

desc "Realizar pruebas de la clase Lista"
task :lista do
    sh "rspec spec/Lista_spec.rb"
end

desc "Realizar pruebas de la clase EtiquetaNutricional"
task :etiqueta do
    sh "rspec spec/EtiquetaNutricional_spec.rb"
end

desc "Realizar pruebas del menú dietético"
task :etiqueta do
    sh "rspec spec/menudiet_spec.rb"
end
