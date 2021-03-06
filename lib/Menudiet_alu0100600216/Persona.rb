
require "Menudiet_alu0100600216/DatosAnt"

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
    def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, nivel_act)
        @nombre = nombre
        @datos_ant = DatosAnt.new(peso, talla, edad, sexo, cir_cintura, cir_cadera, nivel_act)
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
    
    ## Peso teórico ideal
    def peso_teorico_ideal
        (@datos_ant.talla - 150) * 0.75 + 50
    end
  
    ## Gasto energético basal
    def gasto_energetico_basal
        if @datos_ant.sexo == 0
            (10 * @datos_ant.peso) + (6.25 * @datos_ant.talla) - (5 * @datos_ant.edad) - 161
        else
            (10 * @datos_ant.peso) + (6.25 * @datos_ant.talla) - (5 * @datos_ant.edad) + 5
        end
    end
    
    ## Efecto termógeno de los alimentos
    def efecto_termogeno
        self.gasto_energetico_basal * 0.1
    end
    
    ## Gasto por actividad física
    def gasto_actividad_fisica
        if @datos_ant.nivel_act == 0
            factor_act = 0.0
        elsif @datos_ant.nivel_act == 1
            factor_act = 0.12
        elsif @datos_ant.nivel_act == 2
            factor_act = 0.27
        else
            factor_act = 0.54
        end
        self.gasto_energetico_basal * factor_act
    end
    
    ## Gasto energético total
    def gasto_energetico_total
        self.gasto_energetico_basal + self.efecto_termogeno + self.gasto_actividad_fisica
    end

end