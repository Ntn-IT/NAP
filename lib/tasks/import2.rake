# frozen_string_literal: true

require 'csv'
desc 'Import personne from csv file'
task import: [:environment] do
  #ActiveRecord::Base.connection.execute("TRUNCATE personnes RESTART IDENTITY")
  #créer constante appelée column mapping en cle mettre le nom de la colonne SAP
  #et en valeur le nom de la column utilisée en base. 
  file = 'db/personnes.csv'
  CSV.foreach(file, col_sep: ';', headers: true) do |row|
    personne_hash = row.to_hash
    personne = Personne.where(id: personne_hash['id'])
    if personne.count == 1
      personne.first.update_attributes(personne_hash)
    else
      Personne.create!(personne_hash)
    end
  end
end
