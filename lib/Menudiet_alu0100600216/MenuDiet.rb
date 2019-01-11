require "./lib/Menudiet_alu0100600216.rb"

##
# Author::    Andrés Concepción Afonso
# Mail::      alu0100600216@ull.edu.es
#
# == Clase Menu
# Esta clase implementa un menú dietético como DSL
#

class Menu

    ## Método initialize
    def initialize(nombre, &block)
        @nombre = nombre
        @desayuno = []
        @almuerzo = []
        @cena = []

        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end
    end

    # Definición del título
    def titulo(title)
  	    @titulo = title
    end

    # Definición de la ingesta
    def ingesta(options = {})

  	    @min = (options[:min]) if options[:min]
  	    @max = (options[:max]) if options[:max]

    end

    # Definición del desayuno
    def desayuno(nombre_alimento, options = {})

        nombre_alimento = nombre_alimento
        porcion = options[:porcion] ? options[:porcion] : nil
        grasas = options[:grasas] ? options[:grasas] : 0.0
        grasas_saturadas = options[:grasas_saturadas] ? options[:grasas_saturadas] : 0.0
        hidratos_carbono = options[:hidratos_carbono] ? options[:hidratos_carbono] : 0.0
        azucares = options[:azucares] ? options[:azucares] : 0.0
        proteinas = options[:proteinas] ? options[:proteinas] : 0.0
        sal = options[:sal] ? options[:sal] : 0.0
        grasas_mono = options[:grasas_mono] ? options[:grasas_mono] : 0.0
        grasas_poli = options[:grasas_poli] ? options[:grasas_poli] : 0.0
        polialcoholes = options[:polialcoholes] ? options[:polialcoholes] : 0.0
        almidon = options[:almidon] ? options[:almidon] : 0.0
        fibra = options[:fibra] ? options[:fibra] : 0.0
        vitaminas = options[:vitaminas] ? options[:vitaminas] : 0.0
        minerales = options[:minerales] ? options[:minerales] : 0.0

        etiqueta = Etiqueta.new(nombre_alimento, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal, grasas_mono, grasas_poli, polialcoholes, almidon, fibra, vitaminas, minerales)
        etiqueta.calc_valor_energ_kcal()

        @desayuno << etiqueta
          
    end

    # Definición del almuerzo
    def almuerzo(nombre_alimento, options = {})

        nombre_alimento = nombre_alimento
        porcion = options[:porcion] ? options[:porcion] : nil
        grasas = options[:grasas] ? options[:grasas] : 0.0
        grasas_saturadas =  options[:grasas_saturadas] ? options[:grasas_saturadas] : 0.0
        hidratos_carbono = options[:hidratos_carbono] ? options[:hidratos_carbono] : 0.0
        azucares = options[:azucares] ? options[:azucares] : 0.0
        proteinas = options[:proteinas] ? options[:proteinas] : 0.0
        sal = options[:sal] ? options[:sal] : 0.0
        grasas_mono = options[:grasas_mono] ? options[:grasas_mono] : 0.0
        grasas_poli = options[:grasas_poli] ? options[:grasas_poli] : 0.0
        polialcoholes = options[:polialcoholes] ? options[:polialcoholes] : 0.0
        almidon = options[:almidon] ? options[:almidon] : 0.0
        fibra = options[:fibra] ? options[:fibra] : 0.0
        vitaminas = options[:vitaminas] ? options[:vitaminas] : 0.0
        minerales = options[:minerales] ? options[:minerales] : 0.0

        etiqueta = Etiqueta.new(nombre_alimento, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal, grasas_mono, grasas_poli, polialcoholes, almidon, fibra, vitaminas, minerales)
        etiqueta.calc_valor_energ_kcal()

        @almuerzo << etiqueta

    end

    # Definición de la cena
    def cena(nombre_alimento, options = {})

        nombre_alimento = nombre_alimento
        porcion = options[:porcion] ? options[:porcion] : nil
        grasas = options[:grasas] ? options[:grasas] : 0.0
        grasas_saturadas =  options[:grasas_saturadas] ? options[:grasas_saturadas] : 0.0
        hidratos_carbono = options[:hidratos_carbono] ? options[:hidratos_carbono] : 0.0
        azucares = options[:azucares] ? options[:azucares] : 0.0
        proteinas = options[:proteinas] ? options[:proteinas] : 0.0
        sal = options[:sal] ? options[:sal] : 0.0
        grasas_mono = options[:grasas_mono] ? options[:grasas_mono] : 0.0
        grasas_poli = options[:grasas_poli] ? options[:grasas_poli] : 0.0
        polialcoholes = options[:polialcoholes] ? options[:polialcoholes] : 0.0
        almidon = options[:almidon] ? options[:almidon] : 0.0
        fibra = options[:fibra] ? options[:fibra] : 0.0
        vitaminas = options[:vitaminas] ? options[:vitaminas] : 0.0
        minerales = options[:minerales] ? options[:minerales] : 0.0

        etiqueta = Etiqueta.new(nombre_alimento, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal, grasas_mono, grasas_poli, polialcoholes, almidon, fibra, vitaminas, minerales)
        etiqueta.calc_valor_energ_kcal()

        @cena << etiqueta

    end

    # calculamos el valor energético total
    def valor_energetico_total

        @valor_energetico = @desayuno.map{|x| x.calc_valor_energ_kcal}.reduce(:+)
        @valor_energetico += @almuerzo.map{|x| x.calc_valor_energ_kcal}.reduce(:+)
        @valor_energetico += @cena.map{|x| x.calc_valor_energ_kcal}.reduce(:+)

    end

    # método to_s    
    def to_s
		
        output = "\n"
        output << "%-25s" % "#{@nombre}"
		
        output << "Composición Nutricional\n"
		output << "================================================================================================\n"
		output << "\t\t\t Grasas  Hidr. Carbono \tProteínas   Fibra  \tSal  \tValor energético\n"
        
        output << "Desayuno\n"
		@desayuno.each do |alimento|
            
            output << "%-25s" % "#{alimento.nombre}"
			output << "%-6s" % "#{alimento.grasas}"
			output << "\t #{alimento.hidratos_carbono}"
			output << "\t\t#{alimento.proteinas}"
			output << "\t    #{alimento.fibra} "
			output << "\t#{alimento.sal}\t"
			output << "#{(alimento.calc_valor_energ_kcal*10).floor / 100.0 }\n"
			 
		end

		output << "\nAlmuerzo\n"
		@almuerzo.each do |alimento|
			
			output << "%-25s" % "#{alimento.nombre}"
			output << "%-6s" % "#{alimento.grasas}"
			output << "\t #{alimento.hidratos_carbono}"
			output << "\t\t#{alimento.proteinas}"
			output << "\t    #{alimento.fibra} "
			output << "\t#{alimento.sal}\t"
			output << "#{(alimento.calc_valor_energ_kcal*10).floor / 100.0 }\n"

		end
		
		output << "\nCena\n"
		@cena.each do |alimento|
			
            output << "%-25s" % "#{alimento.nombre}"
			output << "%-6s" % "#{alimento.grasas}"
			output << "\t #{alimento.hidratos_carbono}"
			output << "\t\t#{alimento.proteinas}"
			output << "\t    #{alimento.fibra} "
			output << "\t#{alimento.sal}\t"
			output << "#{(alimento.calc_valor_energ_kcal*10).floor / 100.0 }\n"

        end

		output << "\nValor energético total   "
		output << "#{valor_energetico_total}\n\n"

	end

end