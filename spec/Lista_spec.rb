require './lib/EtiquetaNutricional/Lista.rb'
require './lib/Persona.rb'

RSpec.describe Lista do

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


describe "# Clasificar la lista de pacientes según el IMC" do

    before :each do
    @paciente1 = Paciente.new("Adrián", 45, 170, 1,2,3,4)
    @paciente2 = Paciente.new("Berto", 130, 165, 1,2,3,4)
    @paciente3 = Paciente.new("Carmen", 45, 154, 1,2,3,4)
    @paciente4 = Paciente.new("Delia", 87, 163, 1,2,3,4)
    @paciente5 = Paciente.new("Enrique", 110, 199, 1,2,3,4)
    @paciente6 = Paciente.new("Francisca", 123, 176, 1,2,3,4)

    end

    it "Clasifica la lista correctamente" do

    listatest2 = Lista.new
    listatest2.insert(@paciente1)
    listatest2.insert(@paciente2)
    listatest2.insert(@paciente3)
    listatest2.insert(@paciente4)
    listatest2.insert(@paciente5)
    listatest2.insert(@paciente6)

    expect(clasificar_por_imc(listatest2)).to eq("Los IMC por debajo de lo normal son [15.6], los IMC dentro de lo normal son [19.0, 27.8] y los que tienen un IMC excesivo son [47.8, 32.7, 39.7]")

    end

end

end


