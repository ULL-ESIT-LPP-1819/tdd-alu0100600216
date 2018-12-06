class DatosAntropometricos

	attr_accessor :peso, :talla, :edad, :sexo, :cir_cintura, :cir_cadera

	include Comparable
	
	def initialize(peso, talla, edad, sexo, cir_cintura, cir_cadera)
		@peso = Float(peso)
		@talla = Float(talla)
		@edad = edad
		@sexo = sexo
		@cir_cintura = Float(cir_cintura)
		@cir_cadera = Float(cir_cadera)
    end

	def <=>(otro)
        [self.peso, self.talla, self.edad, self.sexo, self.cir_cintura, self.cir_cadera, self.indice_masa_corporal, self.porcentaje_grasa, self.rel_cir_cadera] <=> [otro.peso, otro.talla, otro.edad, otro.sexo, otro.cir_cintura, otro.cir_cadera, otro.indice_masa_corporal, otro.porcentaje_grasa, otro.rel_cir_cadera]
    end

    #Cálculo datos antropométricos

    def indice_masa_corporal
		(peso / (talla * talla) * 10000).round(1)
	end


	def imc_segun_tabla
		imc = self.indice_masa_corporal

		if imc < 18.5
			return "#{imc} - menor a 18.5 - Bajo peso"
        elsif imc >= 18.5 && imc < 25.0
			    return "#{imc} - entre 18.5 y 24.9 - Aceptable"
		    elsif imc >= 25.0 && imc < 30.0
			    return "#{imc} -  entre 25.0 y 29.9 - Sobrepeso"
		    elsif imc >= 30.0 && imc < 35.0
			    return "#{imc} - entre 30.0 y 34.9 - Obesidad grado 1"
		    elsif imc >= 35.0
			    return "#{imc} - mayor a 40 - Obesidad grado 2"
		end

	end

	def porcentaje_grasa
		(1.2 * self.indice_masa_corporal + 0.23 * edad - 10.8 * sexo - 5.4).round(1)
	end

	def rel_cir_cadera
		(cir_cintura / cir_cadera).round(2)
	end


    def rcc_segun_tabla
        
		rcc = self.rel_cir_cadera

        # Se discrimina según sexos
		if sexo == 1
			if rcc >= 0.83 && rcc < 0.88
				return "#{rcc} - Bajo - entre 0.83 y 0.88"
				elsif rcc >= 0.88 && rcc < 0.95
					return "#{rcc} - Moderado - entre 0.88 y 0.95"
				elsif rcc >= 0.95 && rcc < 1.01
					return "#{rcc} - Alto - entre 0.95 y 1.01"
				elsif rcc >= 1.01
					return "#{rcc} - Muy alto - mayor a 1.01"
			end
		end

        if sexo == 0
			if rcc >= 0.72 && rcc < 0.75
				return "#{rcc} - Bajo - entre 0.72 y 0.75"
				elsif rcc >= 0.75 && rcc < 0.82
					return "#{rcc} - Moderado - entre 0.75 y 0.82"
				elsif rcc >= 0.82
					return "#{rcc} - Alto - mayor a 0.82"
            end
    	end
    end
    

	def to_s
		a =  "Peso: #{@peso}\n"
		a += "Altura: #{@talla}\n"
		a += "Edad: #{@edad}\n"
		a += "Sexo: #{@sexo}\n"
		a += "Cincurferencia cintura: #{@cir_cintura}\n"
		a += "Cincurferencia cadera: #{@cir_cadera}\n"
		a += "Índice Masa Corporal (IMC): #{self.imc_segun_tabla}\n"
		a += "% grasa: #{self.porcentaje_grasa}\n"
		a += "Relación Circunferencia Cadera (RCC): #{self.rcc_segun_tabla}\n"
	end

end