require "Persona/DatosAntropometricos.rb"

class Persona

    attr_accessor :nombre

    def initilize(nombre)
        @nombre = nombre
    end

    def to_s
        "El nombre es #{nombre}"
    end
end


# Paciente es una clase hija de la clase Persona

class Paciente < Persona

    attr_accessor :datos_antropometricos
  
    def initialize(nombre, peso, talla, edad, sexo, circunferencia_cintura, circunferencia_cadera)
      @nombre = nombre
      @datos_antropometricos = DatosAntropometricos.new(peso, talla, edad, sexo, circunferencia_cintura, circunferencia_cadera)
    end
  
    def to_s
        a = "Nombre del paciente: #{@nombre}\n"
        #a += @datos_antropometricos.to_s
    end
  
  end