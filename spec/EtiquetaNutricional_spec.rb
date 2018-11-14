RSpec.describe EtiquetaNutricional do
    
    it "has a version number" do
      expect(EtiquetaNutricional::VERSION).not_to be nil
    end

# Declaraciones de nutrientes y de nombre de producto
    
    before :each do
      @test1 = Etiqueta.new("test1",1,2,3,4,5,6,6,5,4,3,2,1,0)
    end

    describe "Declaraciones de elementos: Nombre y componentes"
      
      it "Se puede almacenar el nombre" do
        expect(@test1.nombre).to eq("test1")
      end

      it "Se puede guardar las grasas" do
        expect(@test1.grasas).to eq(1)
      end
      
      it "Se puede guardar las grasas saturadas" do
      expect(@test1.grasas_saturadas).to eq(2)
      end

      it "Se puede guardar los hidratos de carbono" do
        expect(@test1.hidratos_carbono).to eq(3)
      end

      it "Se puede guardar los azucares" do
        expect(@test1.azucares).to eq(4)
      end

      it "Se puede guardar las proteinas" do
        expect(@test1.proteinas).to eq(5)
      end

      it "Se puede guardar la sal" do
        expect(@test1.sal).to eq(6)
      end


# Declaración de nutrientes opcionales y si se pueden almacenar

      it "Se puede guardar las grasas monoinsaturadas" do
        expect(@test1.grasas_mono).to eq(6)
      end

      it "Se puede guardar las grasas poliinsaturadas" do
        expect(@test1.grasas_poli).to eq(5)
      end

      it "Se puede guardar los polialcoholes" do
        expect(@test1.polialcoholes).to eq(4)
      end

      it "Se puede guardar el almidón" do
        expect(@test1.almidon).to eq(3)
      end

      it "Se puede guardar la fibra" do
        expect(@test1.fibra).to eq(2)
      end

      it "Se puede guardar las vitaminas" do
        expect(@test1.vitaminas).to eq(1)
      end

      it "Se puede guardar los minerales" do
        expect(@test1.minerales).to eq(0)
      end


## Aquí irán las de cálculo de los valores energéticos













end
