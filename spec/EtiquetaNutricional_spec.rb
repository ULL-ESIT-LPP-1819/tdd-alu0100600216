RSpec.describe EtiquetaNutricional do
    
    it "has a version number" do
      expect(EtiquetaNutricional::VERSION).not_to be nil
    end

# Declaraciones de nutrientes y de nombre de producto
    
    before :each do
      @test1 = Etiqueta.new("test1",1,2,3,4,5,6)
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

end
