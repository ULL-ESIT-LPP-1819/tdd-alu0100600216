require "Persona/DatosAntropometricos.rb"

class Persona

    attr_accessor :nombre

    def initialize(nombre)
        @nombre = nombre
    end

    def to_s
        "El nombre es #{nombre}"
    end
end


# Paciente es una clase hija de la clase Persona

class Paciente < Persona

    include Comparable

    attr_accessor :datos_ant
  
    def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
        @nombre = nombre
        @datos_ant = DatosAntropometricos.new(peso, talla, edad, sexo, cir_cintura, cir_cadera)
    end

    def <=>(otro)
        #[nombre, datos_ant.peso, datos_ant.talla, datos_ant.edad, datos_ant.sexo, datos_ant.cir_cintura, datos_ant.cir_cadera, datos_ant.indice_masa_corporal, datos_ant.porcentaje_grasa, datos_ant.rel_cir_cadera] <=> [otro.nombre, otro.datos_ant.peso, otro.datos_ant.talla, otro.datos_ant.edad, otro.datos_ant.sexo, otro.datos_ant.cir_cintura, otro.datos_ant.cir_cadera, otro.datos_ant.indice_masa_corporal, otro.datos_ant.porcentaje_grasa, otro.datos_ant.rel_cir_cadera]
        [nombre] <=> [otro.nombre]
    end

    def to_s
        a = "Nombre del paciente: #{@nombre}\n"
        a += @datos_ant.to_s
    end
  
  end