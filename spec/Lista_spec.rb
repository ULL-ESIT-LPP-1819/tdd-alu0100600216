require './lib/Menudiet_alu0100600216/Lista.rb'
require './lib/Menudiet_alu0100600216/Persona.rb'

RSpec.describe Lista do

############ Lista de etiquetas

    before :each do

        @etiqueta1 = Etiqueta.new("etiqueta1",0,0,0,0,0,2,0,0,0,0,0,0,0)
        @etiqueta2 = Etiqueta.new("etiqueta2",0,0,0,0,0,3,0,0,0,0,0,0,0)
        @etiqueta3 = Etiqueta.new("etiqueta3",0,0,0,0,0,5,0,0,0,0,0,0,0)
        @etiqueta4 = Etiqueta.new("etiqueta4",0,0,0,0,0,6,0,0,0,0,0,0,0)
        @etiqueta5 = Etiqueta.new("etiqueta5",0,0,0,0,0,10,0,0,0,0,0,0,0)
        @etiqueta6 = Etiqueta.new("etiqueta6",0,0,0,0,0,1,0,0,0,0,0,0,0)
    
    end

    describe "# Probando operaciones en la lista" do

        it "Inserción de una etiqueta" do
            listatest = Lista.new()
            expect(listatest.insert(@etiqueta1)).to be_a(Nodo)
        end

        it "Extracción de una etiqueta" do
            listatest = Lista.new()
            expect(listatest.insert(@etiqueta1)).to be_a(Nodo)
            expect(listatest.extract).to be_a(Nodo)
        end

        it "Se reconoce una lista vacía" do
            listatest = Lista.new()
            expect(listatest.empty).to be true
            expect(listatest.insert(@etiqueta1)).to be_a(Nodo)
            expect(listatest.empty).to be false
            expect(listatest.extract).to be_a(Nodo)
            expect(listatest.empty).to be true
        end

        it "Una lista tiene el tamaño correcto" do
            listatest = Lista.new()
            expect(listatest.length).to eq(0)
            listatest.insert(@etiqueta1)
            listatest.insert(@etiqueta2)
            listatest.insert(@etiqueta3)
            expect(listatest.length).to eq(3)
        end

        # Se imprime bien la lista
        it "Devuelve el contenido de la lista" do
            listatest = Lista.new()
            listatest.insert(@etiqueta1)
            listatest.insert(@etiqueta2)
            expect(listatest.to_s).to be_a(String)
        end
    end

    describe "# Clasificar la lista de etiquetas según la sal" do
    
        it "Clasifica correctamente" do
            listatest = Lista.new()
            listatest.insert(@etiqueta1)
            listatest.insert(@etiqueta2)
            listatest.insert(@etiqueta3)
            listatest.insert(@etiqueta4)
            listatest.insert(@etiqueta5)
            listatest.insert(@etiqueta6)
    
            expect(clasificar_por_sal(listatest)).to eq("Los productos con una cantidad de sal menor o igual a la recomendada son [2, 3, 5, 6, 1] y los que tienen una sal excesiva son [10]")
        end
    end

    describe "# Pruebas Enumerable etiquetas" do
        
        before :each do

            @etiqueta1 = Etiqueta.new("etiqueta1",500,0,0,0,0,2,0,0,0,0,0,0,0)
            @etiqueta2 = Etiqueta.new("etiqueta2",25,0,0,0,0,3,0,0,0,0,0,0,0)
            @etiqueta3 = Etiqueta.new("etiqueta3",300,0,0,0,0,5,0,0,0,0,0,0,0)
            @etiqueta4 = Etiqueta.new("etiqueta4",900,0,0,0,0,6,0,0,0,0,0,0,0)
            @etiqueta5 = Etiqueta.new("etiqueta5",364,0,0,0,0,10,0,0,0,0,0,0,0)
            @etiqueta6 = Etiqueta.new("etiqueta6",60,0,0,0,0,1,0,0,0,0,0,0,0)    
            
            @listaenum = Lista.new
            @listaenum.insert(@etiqueta6)
            @listaenum.insert(@etiqueta5)
            @listaenum.insert(@etiqueta4)
            @listaenum.insert(@etiqueta3)
            @listaenum.insert(@etiqueta2)
            @listaenum.insert(@etiqueta1)

        end


        it "Método collect" do
            expect(@listaenum.collect{|i| i.sal}).to eq([1,10,6,5,3,2])
        end

        it "Metodo select" do
            expect(@listaenum.select{|i| i.grasas > 300}).to eq([@etiqueta5, @etiqueta4, @etiqueta1])
            expect(@listaenum.select{|i| i.sal == 6}).to eq([@etiqueta4])
        end

        it "Metodo max" do
            expect(@listaenum.max{|i,j| i.sal <=> j.sal}).to eq(@etiqueta5)
            expect(@listaenum.max{|i,j| i.grasas <=> j.grasas}).to eq(@etiqueta4)
        end

        it "Metodo min" do
            expect(@listaenum.min{|i,j| i.sal <=> j.sal}).to eq(@etiqueta6)
            expect(@listaenum.min{|i,j| i.grasas <=> j.grasas}).to eq(@etiqueta2)
        end

        it "Metodo sort" do
            expect(@listaenum.sort{|i,j| i.sal <=> j.sal}).to eq([@etiqueta6, @etiqueta1, @etiqueta2, @etiqueta3, @etiqueta4, @etiqueta5])
            expect(@listaenum.sort{|i,j| i.grasas <=> j.grasas}).to eq([@etiqueta2, @etiqueta6, @etiqueta3, @etiqueta5, @etiqueta1, @etiqueta4])
        end

    end


############### Lista de pacientes

    describe "# Clasificar la lista de pacientes según el IMC" do

        before :each do
            @paciente1 = Paciente.new("Adrián", 45, 170, 1,2,3,4,0)
            @paciente2 = Paciente.new("Berto", 130, 165, 1,2,3,4,0)
            @paciente3 = Paciente.new("Carmen", 45, 154, 1,2,3,4,0)
            @paciente4 = Paciente.new("Delia", 87, 163, 1,2,3,4,0)
            @paciente5 = Paciente.new("Enrique", 110, 199, 1,2,3,4,0)
            @paciente6 = Paciente.new("Francisca", 123, 176, 1,2,3,4,0)
        end

        it "Clasifica la lista correctamente" do

            @listatest2 = Lista.new
            @listatest2.insert(@paciente1)
            @listatest2.insert(@paciente2)
            @listatest2.insert(@paciente3)
            @listatest2.insert(@paciente4)
            @listatest2.insert(@paciente5)
            @listatest2.insert(@paciente6)

            expect(clasificar_por_imc(@listatest2)).to eq("Los IMC por debajo de lo normal son [15.6], los IMC dentro de lo normal son [19.0, 27.8] y los que tienen un IMC excesivo son [47.8, 32.7, 39.7]")

        end
    end

    describe "# Pruebas Enumerable Pacientes" do

        before :each do
            @paciente1 = Paciente.new("Adrián", 43, 170, 1,2,3,4,0)
            @paciente2 = Paciente.new("Berto", 130, 165, 1,2,3,4,0)
            @paciente3 = Paciente.new("Carmen", 45, 154, 1,2,3,4,0)
            @paciente4 = Paciente.new("Delia", 87, 163, 1,2,3,4,0)
            @paciente5 = Paciente.new("Enrique", 110, 199, 1,2,3,4,0)
            @paciente6 = Paciente.new("Francisca", 123, 176, 1,2,3,4,0)
   
            @listaenum2 = Lista.new
            @listaenum2.insert(@paciente1)
            @listaenum2.insert(@paciente3)
            @listaenum2.insert(@paciente5)
            @listaenum2.insert(@paciente2)
            @listaenum2.insert(@paciente4)
            @listaenum2.insert(@paciente6)
        
        end

        it "Método collect" do
            expect(@listaenum2.collect{|i| i.datos_ant.talla}).to eq([170,154,199,165,163,176])
            expect(@listaenum2.collect{|i| i.datos_ant.indice_masa_corporal}).to eq([14.9, 19.0, 27.8, 47.8, 32.7, 39.7])

        end

       it "Metodo select" do
            expect(@listaenum2.select{|i| i.datos_ant.talla > 160}).to eq([@paciente1, @paciente5, @paciente2, @paciente4, @paciente6])
            expect(@listaenum2.select{|i| i.datos_ant.indice_masa_corporal < 20}).to eq([@paciente1, @paciente3])
        end

        it "Metodo max" do
            expect(@listaenum2.max{|i,j| i.datos_ant.indice_masa_corporal <=> j.datos_ant.indice_masa_corporal}).to eq(@paciente2)
            expect(@listaenum2.max{|i,j| i.datos_ant.talla <=> j.datos_ant.talla}).to eq(@paciente5)
        end

        it "Metodo min" do
            expect(@listaenum2.min{|i,j| i.datos_ant.peso}).to eq(@paciente1)
            expect(@listaenum2.min{|i,j| i.datos_ant.indice_masa_corporal}).to eq(@paciente1)
        end

        it "Metodo sort" do
            expect(@listaenum2.sort{|i,j| i.datos_ant.peso <=> j.datos_ant.peso}).to eq([@paciente1, @paciente3, @paciente4, @paciente5, @paciente6, @paciente2])
            expect(@listaenum2.sort{|i,j| i.datos_ant.indice_masa_corporal <=> j.datos_ant.indice_masa_corporal}).to eq([@paciente1, @paciente3, @paciente5, @paciente4, @paciente6, @paciente2])
        end
        
    end

end