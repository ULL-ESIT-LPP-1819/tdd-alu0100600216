require './lib/Menudiet_alu0100600216'
require './lib/Menudiet_alu0100600216/Lista.rb'
require './lib/Menudiet_alu0100600216/Persona.rb'
require './lib/Menudiet_alu0100600216/Array.rb'

require 'benchmark'


RSpec.describe Menudiet_alu0100600216 do

    context "# Benchmarks" do

        before :each do

            @paciente1 = Paciente.new("Alba", 65, 170, 25, 0, 75, 95, 0)
            @paciente2 = Paciente.new("Bea", 66, 171, 21, 0, 75, 95, 1)
            @paciente3 = Paciente.new("Carmen", 50, 160, 24, 0, 70, 85, 1)
            @paciente4 = Paciente.new("Dana", 75, 180, 27, 0, 69, 88, 2)
            @paciente5 = Paciente.new("Enrique", 80, 195, 29, 1, 70, 75, 3)
            @paciente6 = Paciente.new("Felix", 66, 178, 28, 0, 75, 95, 0)
            @paciente7 = Paciente.new("Gabriel", 61, 164, 26, 0, 74, 95, 1)
            @paciente8 = Paciente.new("Hipolito", 58, 162, 22, 0, 76, 83, 1)
            @paciente9 = Paciente.new("Ignacio", 78, 188, 27, 0, 67, 88, 2)
            @paciente10 = Paciente.new("Juan", 89, 201, 29, 1, 72, 75, 3)

            @pacientes_lista = Lista.new
            @pacientes_lista.insert(@paciente1)
            @pacientes_lista.insert(@paciente2)
            @pacientes_lista.insert(@paciente3)
            @pacientes_lista.insert(@paciente4)
            @pacientes_lista.insert(@paciente5)
            @pacientes_lista.insert(@paciente6)
            @pacientes_lista.insert(@paciente7)
            @pacientes_lista.insert(@paciente8)
            @pacientes_lista.insert(@paciente9)
            @pacientes_lista.insert(@paciente10)

   
            @etiqueta1 = Etiqueta.new("a", 170,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta2 = Etiqueta.new("b", 30,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta3 = Etiqueta.new("c", 70,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta4 = Etiqueta.new("d", 90,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta5 = Etiqueta.new("e", 105,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta6 = Etiqueta.new("f", 65,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta7 = Etiqueta.new("g", 73,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta8 = Etiqueta.new("h", 80,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta9 = Etiqueta.new("i", 98,0,0,0,0,0,0,0,0,0,0,0,0)
            @etiqueta10 = Etiqueta.new("j", 60,0,0,0,0,0,0,0,0,0,0,0,0)
            
            @menu1 = Lista.new
            @menu1.insert(@etiqueta2)
            @menu1.insert(@etiqueta8)
            @menu1.insert(@etiqueta5)

            @menu2 = Lista.new
            @menu2.insert(@etiqueta4)
            @menu2.insert(@etiqueta7)
            @menu2.insert(@etiqueta8)

            @menu3 = Lista.new
            @menu3.insert(@etiqueta1)
            @menu3.insert(@etiqueta5)
            @menu3.insert(@etiqueta3)

            @menu4 = Lista.new
            @menu4.insert(@etiqueta7)
            @menu4.insert(@etiqueta9)
            @menu4.insert(@etiqueta3)  

            @menu5 = Lista.new
            @menu5.insert(@etiqueta6)
            @menu5.insert(@etiqueta2)
            @menu5.insert(@etiqueta4)

            @menu6 = Lista.new
            @menu6.insert(@etiqueta7)
            @menu6.insert(@etiqueta4)
            @menu6.insert(@etiqueta1)
            
            @menu7 = Lista.new
            @menu7.insert(@etiqueta3)
            @menu7.insert(@etiqueta6)
            @menu7.insert(@etiqueta5)
            
            @menu8 = Lista.new
            @menu8.insert(@etiqueta10)
            @menu8.insert(@etiqueta8)
            @menu8.insert(@etiqueta2)
            
            @menu9 = Lista.new
            @menu9.insert(@etiqueta8)
            @menu9.insert(@etiqueta6)
            @menu9.insert(@etiqueta9)
            
            @menu10 = Lista.new
            @menu10.insert(@etiqueta7)
            @menu10.insert(@etiqueta5)
            @menu10.insert(@etiqueta3)

            @menu_array = [@menu1,@menu2,@menu3,@menu4,@menu5,@menu6,@menu7,@menu8,@menu9,@menu10]
            @menu_array = @menu_array.map{|i| i.collect{|j| j.calc_valor_energ_kcal}}

        end
        
        it "Menus almacenados en array" do
            expect(@menu_array).to be_an_instance_of(Array)
            expect(@menu_array.size).to eq(10)
        end
        
        it "Pacientes almacenados en lista" do
            expect(@pacientes_lista).to be_an_instance_of(Lista)
            expect(@pacientes_lista.length).to eq(10)
        end

        it "Ordenados pacientes y menús usando bucles for" do
            expect(@pacientes_lista.ordenar_for).to eq([1487.18, 1569.15, 1612.23, 1618.65, 1639.68, 1784.555, 2163.23, 2272.83, 3081.15, 3290.25])
            expect(@menu_array.ordenar_for).to eq([1530.0, 1665.0, 1935.0, 2160.0, 2169.0, 2187.0, 2187.0, 2232.0, 2997.0, 3105.0])
        end

        it "Ordenados pacientes y menús usando each" do
            expect(@pacientes_lista.ordenar_each).to eq([1487.18, 1569.15, 1612.23, 1618.65, 1639.68, 1784.555, 2163.23, 2272.83, 3081.15, 3290.25])
            expect(@menu_array.ordenar_each).to eq([1530.0, 1665.0, 1935.0, 2160.0, 2169.0, 2187.0, 2187.0, 2232.0, 2997.0, 3105.0])
        end

        it "Ordenados pacientes y menús usando sort" do
            expect(@pacientes_lista.map{|x| x.gasto_energetico_total}.sort).to eq([1487.18, 1569.15, 1612.23, 1618.65, 1639.68, 1784.555, 2163.23, 2272.83, 3081.15, 3290.25])
            expect(@menu_array.map{|x| x.reduce(:+)}.sort).to eq([1530.0, 1665.0, 1935.0, 2160.0, 2169.0, 2187.0, 2187.0, 2232.0, 2997.0, 3105.0])
        end

        it "Pruebas bechmark" do
            
            n=10000

            Benchmark.bm do |x|
                x.report("Lista usando for:") {n.times do @pacientes_lista.ordenar_for; end}
                x.report("Lista usando each:"){n.times do @pacientes_lista.ordenar_each; end}
                x.report("Lista usando sort:"){n.times do @pacientes_lista.map{|x| x.gasto_energetico_total}.sort ; end}
        
                x.report("Array usando for:") {n.times do @menu_array.ordenar_for; end}
                x.report("Array usando each:"){n.times do @menu_array.ordenar_each; end}
                x.report("Array usando sort:"){n.times do @menu_array.map{|x| x.reduce(:+)}.sort; end}
            end
        end
        
    end
end