require './lib/EtiquetaNutricional/Lista.rb'

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

describe "# Clasificar la lista" do
    
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

end


