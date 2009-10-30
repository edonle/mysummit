class Participante < ActiveRecord::Base
  validates_presence_of :nome, :message => "não pode ser em branco"
  validates_length_of :nome, :within => 2..50, :too_long => "muito longo", :too_short => "muito curto"
end

