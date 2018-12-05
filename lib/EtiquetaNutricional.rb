require "EtiquetaNutricional/version"

class Etiqueta

    include Comparable

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

    def <=>(otro)
        [self.nombre, self.grasas, self.grasas_saturadas, self.hidratos_carbono, self.azucares, self.proteinas, self.sal, self.grasas_mono, self.grasas_poli, self.polialcoholes, self.almidon, self.fibra, self.vitaminas, self.minerales] <=> [otro.nombre, otro.grasas, otro.grasas_saturadas, otro.hidratos_carbono, otro.azucares, otro.proteinas, otro.sal, otro.grasas_mono, otro.grasas_poli, otro.polialcoholes, otro.almidon, otro.fibra, otro.vitaminas, otro.minerales]
    end 
    # Cálculo del valor energético 
    
    def calc_valor_energ_kJ()

      @grasas*37 + @grasas_mono*37 + @grasas_poli*37 + @hidratos_carbono*17 + @polialcoholes*10 + @almidon*17 + @fibra*8 + @proteinas*17 + @sal*25

    end

    def calc_valor_energ_kcal()

      @grasas*9 + @grasas_mono*9 + @grasas_poli*9 + @hidratos_carbono*4 + @polialcoholes*2.4 + @almidon*4 + @fibra*2 + @proteinas*4 + @sal*6

    end


    ## Falta ingesta referencia !!!




    ## Método para imprimir la etiqueta

    def to_s

      a  = "Por porción (100g) \n"
      a += "Valor energético \t #{self.calc_valor_energ_kJ} kJ / 8.400 kJ IR\n"
      a += "\t\t #{self.calc_valor_energ_kcal} kcal / 2.000 kcal IR\n"
      a += "Grasas \t #{@grasas} g.\n"
      a += "Grasas saturadas \t #{@grasas_saturadas} g.\n"
      a += "Hidratos de carbono \t #{@hidratos_carbono} g.\n"
      a += "Azúcares \t #{@azucares} g.\n"
      a += "Proteínas \t #{@proteinas} g.\n"
      a += "Sal \t #{@sal} g.\n"
      
      ## SI HAY NUTRIENTES VOLUNTARIOS DECLARADOS
      
      if @grasas_mono
          a += "Grasas monoinsaturadas\t #{@grasas_m} g.\n"
      end
      
      if @grasas_poli
          a += "Grasas poliinsaturadas\t #{@grasas_p} g.\n"
      end
      
      if @polialcoholes
          a += "Polialcoholes\t #{@polialcoholes} g.\n"
      end
    
      if @almidon
          a += "Almidón\t #{@almidon} g.\n"
      end
  
      if @fibra
          a +=  "Fibra alimentaria\t #{@fibra} g.\n"
      end

      if @vitaminas
          a +=  "Vitaminas\t #{@vitaminas} g.\n"
      end
      
      if @minerales
          a +=  "Minerales\t #{@minerales} g.\n"
      end
  
  end

end
