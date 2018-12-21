require './lib/EtiquetaNutricional'
require './lib/EtiquetaNutricional/Lista.rb'
require './lib/EtiquetaNutricional/Persona.rb'




RSpec.describe EtiquetaNutricional do

    context "# Benchmarks" do

        before :each do

            @paciente1 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95, 0)
            @paciente2 = Paciente.new("Bea", 65, 170, 26, 0, 75, 95, 1)
            @paciente3 = Paciente.new("Carmen", 58, 163, 24, 0, 70, 83, 1)
            @paciente4 = Paciente.new("Dana", 75, 180, 27, 0, 69, 88, 2)
            @paciente5 = Paciente.new("Enrique", 80, 195, 29, 1, 70, 75, 3)
            @paciente6 = Paciente.new("Felix", 66, 178, 27, 0, 75, 95, 0)
            @paciente7 = Paciente.new("Gabriel", 61, 164, 26, 0, 74, 95, 1)
            @paciente8 = Paciente.new("Hipolito", 58, 160, 24, 0, 76, 83, 1)
            @paciente9 = Paciente.new("Ignacio", 78, 188, 27, 0, 67, 88, 2)
            @paciente10 = Paciente.new("Juan", 89, 201, 29, 1, 72, 75, 3)

            @pacientes_listaenl = Lista.new
            @pacientes_listaenl.insert(@paciente1)
            @pacientes_listaenl.insert(@paciente2)
            @pacientes_listaenl.insert(@paciente3)
            @pacientes_listaenl.insert(@paciente4)
            @pacientes_listaenl.insert(@paciente5)
            @pacientes_listaenl.insert(@paciente6)
            @pacientes_listaenl.insert(@paciente7)
            @pacientes_listaenl.insert(@paciente8)
            @pacientes_listaenl.insert(@paciente9)
            @pacientes_listaenl.insert(@paciente10)

   
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
        end
        
        it "Menus almacenados en array" do
            expect(@menu_array).to be_an_instance_of(Array)
            expect(@menu_array.size).to eq(10)
        end
        
        it "Pacientes almacenados en lista" do
            expect(@pacientes_listaenl).to be_an_instance_of(Lista)
            expect(@pacientes_listaenl.length).to eq(10)
        end

    end
end