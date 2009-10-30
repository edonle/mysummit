require 'spec_helper'

module ParticipanteSpecHelper
  def valid_participante_attributes
    {
      :nome => 'Edson'
    }
  end
end

describe Participante do

  include ParticipanteSpecHelper

  before do

    @participante = Participante.new
  end

#  Comentários

  it "deve ser valido" do

    @participante.attributes = valid_participante_attributes
    @participante.should be_valid
  end

  it "nome é requerido" do
    @participante.attributes = valid_participante_attributes.except(:nome)
    @participante.nome = ''
    @participante.should_not be_valid
    @participante.errors.on(:nome).should include("não pode ser em branco")
    @participante.nome = "Edson"
    @participante.should be_valid
  end

  it "deve ter no maximo 50 caracteres" do

    @participante.attributes = valid_participante_attributes.except(:nome)
    @participante.nome = 'Edson Edson Edson Edson Edson Edson Edson Edson Edson Edson '
    @participante.should_not be_valid
    @participante.errors.on(:nome).should include("muito longo")
  end

  it "deve ter no minimo 2 caracteres" do

    @participante.attributes = valid_participante_attributes.except(:nome)
    @participante.nome = 'E'
    @participante.should_not be_valid
    @participante.errors.on(:nome).should include("muito curto")
  end
end

