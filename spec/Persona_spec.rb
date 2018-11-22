require './lib/Persona.rb'

RSpec.describe Persona do

    describe "Probando jerarquía" do

        before :each do
            @persona1 = Persona.new() 
            @persona2 = Paciente.new("Alba", 65, 170, 26, 0, 75, 95)
        end

        it "P1 es una person" do
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
end