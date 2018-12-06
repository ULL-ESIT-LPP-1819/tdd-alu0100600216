
require "EtiquetaNutricional/DatosAnt"

##
# Author::    Andrés Concepción Afonso
# Mail::      alu0100600216@ull.edu.es
#
# == Clase Persona
# Esta clase sólo almacena el nombre de una persona. Es necesaria para
# que la clase hija Paciente herede los atributos de Persona
#

class Persona

    attr_accessor :nombre
    
    ## Método initialize
    def initialize(nombre)
        @nombre = nombre
    end

    ## Método to_s
    def to_s
        "El nombre es #{nombre}"
    end
end

##
# == Clase Paciente
# Paciente es una clase hija de la clase Persona que almacena además
# del nombre los datos antropométricos de dicho paciente (que se
# encuentran en un objeto DatosAnt)
#

class Paciente < Persona

    include Comparable
    attr_accessor :datos_ant
    
    ## Método initialize
    def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera)
        @nombre = nombre
        @datos_ant = DatosAnt.new(peso, talla, edad, sexo, cir_cintura, cir_cadera)
    end

    ## Método comparador (necesario para poder usar las funciones de Comparable)
    def <=>(otro)
        [nombre] <=> [otro.nombre]
    end

    ## Método to_s para imprimir los datos de un paciente
    def to_s
        a = "Nombre del paciente: #{@nombre}\n"
        a += @datos_ant.to_s
    end
  
  end