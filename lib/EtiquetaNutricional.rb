require "EtiquetaNutricional/version"

class Etiqueta

    attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal

    def initialize(nombre, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal)
      @nombre = nombre
      @grasas = grasas
      @grasas_saturadas = grasas_saturadas
      @hidratos_carbono = hidratos_carbono
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
    end

end
