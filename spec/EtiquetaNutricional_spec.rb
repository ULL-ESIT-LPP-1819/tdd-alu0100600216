RSpec.describe EtiquetaNutricional do
    
    it "has a version number" do
      expect(EtiquetaNutricional::VERSION).not_to be nil
    end

# Declaraciones de nutrientes y de nombre de producto
    
    before :each do
      @test = Etiqueta.new("test",1,2,3,4,5,6,6,5,4,3,2,1,0)
    end

    describe "# Declaraciones de elementos: Nombre y componentes"
      
      it "Se puede almacenar el nombre" do
        expect(@test.nombre).to eq("test")
      end

      it "Se puede guardar las grasas" do
        expect(@test.grasas).to eq(1)
      end
      
      it "Se puede guardar las grasas saturadas" do
      expect(@test.grasas_saturadas).to eq(2)
      end

      it "Se puede guardar los hidratos de carbono" do
        expect(@test.hidratos_carbono).to eq(3)
      end

      it "Se puede guardar los azucares" do
        expect(@test.azucares).to eq(4)
      end

      it "Se puede guardar las proteinas" do
        expect(@test.proteinas).to eq(5)
      end

      it "Se puede guardar la sal" do
        expect(@test.sal).to eq(6)
      end


# Declaración de nutrientes opcionales y si se pueden almacenar

      it "Se puede guardar las grasas monoinsaturadas" do
        expect(@test.grasas_mono).to eq(6)
      end

      it "Se puede guardar las grasas poliinsaturadas" do
        expect(@test.grasas_poli).to eq(5)
      end

      it "Se puede guardar los polialcoholes" do
        expect(@test.polialcoholes).to eq(4)
      end

      it "Se puede guardar el almidón" do
        expect(@test.almidon).to eq(3)
      end

      it "Se puede guardar la fibra" do
        expect(@test.fibra).to eq(2)
      end

      it "Se puede guardar las vitaminas" do
        expect(@test.vitaminas).to eq(1)
      end

      it "Se puede guardar los minerales" do
        expect(@test.minerales).to eq(0)
      end


## Cálculo de los valores energéticos

    describe "# Calcula los valores energéticos"
      
      it "Calculado el valor en kJ" do
        expect(@test.calc_valor_energ_kJ()).to eq(837)
      end

      it "Calculado el valor en kcal" do
        expect(@test.calc_valor_energ_kcal()).to eq(201.6)
      end


## Etiqueta impresa

    describe "# Imprime la etiqueta bien formateada"
      
      it "Imprime etiqueta bien" do
          expect(@test.to_s).to be_a(String)
      end

end
