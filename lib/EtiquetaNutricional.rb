require "EtiquetaNutricional/version"

class Etiqueta

    attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal, :grasas_mono, :grasas_poli, :polialcoholes, :almidon, :fibra, :vitaminas, :minerales

    def initialize(nombre, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal, grasas_mono, grasas_poli, polialcoholes, almidon, fibra, vitaminas, minerales)
      
      #obligatorias
      @nombre = nombre
      @grasas = grasas
      @grasas_saturadas = grasas_saturadas
      @hidratos_carbono = hidratos_carbono
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
      #opcionales
      @grasas_mono = grasas_mono
      @grasas_poli = grasas_poli
      @polialcoholes = polialcoholes
      @almidon = almidon
      @fibra = fibra
      @vitaminas = vitaminas
      @minerales = minerales

    end

    # Cálculo del valor energético 
    
    def calc_valor_energ_kJ()

      @grasas*37 + @grasas_mono*37 + @grasas_poli*37 + @hidratos_carbono*17 + @polialcoholes*10 + @almidon*17 + @fibra*8 + @proteinas*17 + @sal*25

    end

    def calc_valor_energ_kcal()

      @grasas*9 + @grasas_mono*9 + @grasas_poli*9 + @hidratos_carbono*4 + @polialcoholes*2.4 + @almidon*4 + @fibra*2 + @proteinas*4 + @sal*6

    end


    ## Falta ingesta referencia !!!




end
