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

    describe "# Prueba de métodos cálculo datos antropométricos" do

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

    describe "# Pruebas Comparable" do

        # nombre, peso, talla, edad, sexo, circunferencia_cintura, circunferencia_cadera
        before :each do    
            @persona0 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95)
            @persona1 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95)
            @persona2 = Paciente.new("Bea", 65, 170, 26, 0, 75, 95)
            @persona3 = Paciente.new("Carmen", 58, 163, 24, 0, 70, 83)
            @persona4 = Paciente.new("Dana", 75, 180, 27, 0, 69, 88)
        end

        it "Operador ==" do
            expect(@persona0 == @persona1).to eq(true)
            expect(@persona1 == @persona2).to eq(false)
        end


        it "Operadores < y >" do
            expect(@persona2.datos_antropometricos.talla < @persona4.datos_antropometricos.talla).to eq(true)
            expect(@persona4.datos_antropometricos.talla > @persona3.datos_antropometricos.talla).to eq(true)
        end

        it "Operadores <= y >=" do
            expect(@persona0.datos_antropometricos.talla <= @persona1.datos_antropometricos.talla).to eq(true)
            expect(@persona1.datos_antropometricos.talla >= @persona2.datos_antropometricos.talla).to eq(true)
            expect(@persona2.datos_antropometricos.talla <= @persona3.datos_antropometricos.talla).to eq(false)
            expect(@persona3.datos_antropometricos.talla >= @persona4.datos_antropometricos.talla).to eq(false)
        end

        it "Operador between?" do
            expect(@persona2.datos_antropometricos.talla.between?(@persona3.datos_antropometricos.talla,@persona4.datos_antropometricos.talla)).to eq(true)
        end
    end
end