
require './lib/EtiquetaNutricional/Lista.rb'
require './lib/EtiquetaNutricional/Persona.rb'
require './lib/EtiquetaNutricional.rb'

RSpec.describe Paciente do

    before :each do

        @paciente1 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95, 0)
        @paciente2 = Paciente.new("Bea", 65, 170, 26, 0, 75, 95, 1)
        @paciente3 = Paciente.new("Carmen", 58, 163, 24, 0, 70, 83, 1)
        @paciente4 = Paciente.new("Dana", 75, 180, 27, 0, 69, 88, 2)
        @paciente5 = Paciente.new("Enrique", 80, 195, 29, 1, 70, 75, 3)

        @etiqueta1 = Etiqueta.new("a", 170,0,0,0,0,0,0,0,0,0,0,0,0)
        @etiqueta2 = Etiqueta.new("b", 30,0,0,0,0,0,0,0,0,0,0,0,0)
        @etiqueta3 = Etiqueta.new("c", 70,0,0,0,0,0,0,0,0,0,0,0,0)
        @etiqueta4 = Etiqueta.new("d", 90,0,0,0,0,0,0,0,0,0,0,0,0)
        @etiqueta5 = Etiqueta.new("e", 105,0,0,0,0,0,0,0,0,0,0,0,0)
        @etiqueta6 = Etiqueta.new("f", 65,0,0,0,0,0,0,0,0,0,0,0,0)
        
        @menu1 = Lista.new
        @menu1.insert(@etiqueta2)
        @menu1.insert(@etiqueta3)
        @menu1.insert(@etiqueta4)

        @menu2 = Lista.new
        @menu2.insert(@etiqueta6)
        @menu2.insert(@etiqueta3)
        @menu2.insert(@etiqueta4)

        @menu3 = Lista.new
        @menu3.insert(@etiqueta2)
        @menu3.insert(@etiqueta4)
        @menu3.insert(@etiqueta6)
       
        @menu4 = Lista.new
        @menu4.insert(@etiqueta1)
        @menu4.insert(@etiqueta5)
        @menu4.insert(@etiqueta6)

        @menu5 = Lista.new
        @menu5.insert(@etiqueta2)
        @menu5.insert(@etiqueta3)
        @menu5.insert(@etiqueta6)

        @listamenus = Lista.new
        @listamenus.insert(@menu1)
        @listamenus.insert(@menu2)
        @listamenus.insert(@menu3)
        @listamenus.insert(@menu4)
        @listamenus.insert(@menu5)

        @listamenus = @listamenus.map{|i| i.collect{|j| j.calc_valor_energ_kcal}}
        @listamenus = @listamenus.map{|i| i.reduce(:+)}
    
    end

    describe "# Idoneidad de menú para los pacientes" do
        
        it "Para el paciente 1" do 
            expect(@listamenus.map{|i| i.between?((@paciente1.gasto_energetico_total*0.9),(@paciente1.gasto_energetico_total*1.1))}).to eq([true, false, true, false, true])
        end

        it "Para el paciente 2" do
            expect(@listamenus.map{|i| i.between?((@paciente2.gasto_energetico_total*0.9),(@paciente2.gasto_energetico_total*1.1))}).to eq([true, false, true, false, false])
        end

        it "Para el paciente 3" do
            expect(@listamenus.map{|i| i.between?((@paciente3.gasto_energetico_total*0.9),(@paciente3.gasto_energetico_total*1.1))}).to eq([true, false, true, false, true])
        end

        it "Para el paciente 4" do
            expect(@listamenus.map{|i| i.between?((@paciente4.gasto_energetico_total*0.9),(@paciente4.gasto_energetico_total*1.1))}).to eq([false, true, false, false, false])
        end

        it "Para el paciente 5" do
            expect(@listamenus.map{|i| i.between?((@paciente5.gasto_energetico_total*0.9),(@paciente5.gasto_energetico_total*1.1))}).to eq([false, false, false, true, false])
        end
    end

end