require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Realizar pruebas de la clase Persona"
task :spec do
    sh "rspec -I spec/Persona_spec.rb"
end

desc "Realizar pruebas de la clase Lista"
task :spec do
    sh "rspec -I spec/Lista_spec.rb"
end

desc "Realizar pruebas de la clase Etiqueta"
task :spec do
    sh "rspec -I spec/EtiquetaNutricional_spec.rb"
end
