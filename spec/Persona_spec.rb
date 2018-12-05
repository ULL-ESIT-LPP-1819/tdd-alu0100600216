require './lib/Persona.rb'

RSpec.describe Persona do

    describe "# Pruebas de jerarquía" do

        before :each do
            @persona1 = Persona.new("Dana") 
            @persona2 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95)
        end

        it "P1 es una persona" do
            expect(@persona1).to be_an_instance_of(Persona)
        end
    
        it "P2 es un paciente" do
            expect(@persona2).to be_an_instance_of(Paciente)
        end
    
        it "Se cumple la jerarquía de clases" do
            # para una persona
            expect(@persona1).not_to be_a_kind_of(Paciente)
            expect(@persona1).to be_a_kind_of(Persona)
            expect(@persona1).to be_a_kind_of(Object)
            expect(@persona1).to be_a_kind_of(BasicObject)
            # para un paciente
            expect(@persona2).to be_a_kind_of(Paciente)
            expect(@persona2).to be_a_kind_of(Persona)
            expect(@persona2).to be_a_kind_of(Object)
            expect(@persona2).to be_a_kind_of(BasicObject)
        end
    end

    describe "# Pruebas de acceso y de métodos" do

        before :each do
            @persona1 = Persona.new("Dana") 
            @persona2 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95)
        end

        it "Persona devuelve nombre" do
            expect(@persona1).to respond_to(:nombre)
        end

        it "Paciente devuelve nombre y datos" do
          expect(@persona2).to respond_to(:nombre, :datos_antropometricos)
        end
  
        it "Persona devuelve to_s" do
          expect(@persona1).to respond_to('to_s')
        end

        it "Paciente devuelve to_s" do
            expect(@persona2).to respond_to('to_s')
          end
    
    end

    describe "Prueba de métodos cálculo datos antropométricos" do

        before :each do
            @datos1 = DatosAntropometricos.new(65, 170, 26, 0, 75, 95)
        end

        it "Calcula IMC bien" do
            expect(@datos1.indice_masa_corporal).to eq(22.5)
        end

        it "Calcula IMC según tabla bien" do
            expect(@datos1.imc_segun_tabla).to eq("22.5 - entre 18.5 y 24.9 - Aceptable")
        end

        it "Calcula porcentaje grasa bien" do
            expect(@datos1.porcentaje_grasa).to eq(27.6)
        end

        it "Calcula RCC bien" do
            expect(@datos1.relacion_circunferencia_cadera).to eq(0.79)
        end

        it "Calcula RCC según tabla bien" do
            expect(@datos1.rcc_segun_tabla).to eq("0.79 - Moderado - entre 0.75 y 0.82")
        end

    end

end