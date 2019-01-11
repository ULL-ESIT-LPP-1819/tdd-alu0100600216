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
task :menudiet do
    sh "rspec spec/MenuDiet_spec.rb"
end

desc "Realizar pruebas de la idoneidad del menú dietético"
task :menupac do
    sh "rspec spec/MenuPaciente_spec.rb"
end

desc "Realizar pruebas de benchmark"
task :benchmark do
    sh "rspec spec/Benchmark_spec.rb"
end
