class DatosAntropometricos

	attr_accessor :peso, :talla, :edad, :sexo, :circunferencia_cintura, :circunferencia_cadera

	def initialize(peso, talla, edad, sexo, circunferencia_cintura, circunferencia_cadera)
		@peso = Float(peso)
		@talla = Float(talla)
		@edad = edad
		@sexo = sexo
		@circunferencia_cintura = Float(circunferencia_cintura)
		@circunferencia_cadera = Float(circunferencia_cadera)
    end
    
end