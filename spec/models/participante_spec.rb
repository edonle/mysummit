require 'spec_helper'

describe Participante do

  it "should have a nome" do

    participante = Participante.new
    participante.nome = "Edson"
    participante.nome.should be == "Edson"
  end

  it "should be valid" do

    participante = Participante.new
    participante.nome = "Edson"
    participante.should be_valid
  end

end

