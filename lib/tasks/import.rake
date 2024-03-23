# frozen_string_literal: true

require 'csv'

def parse_date(date)
  Date.strptime(date, '%m/%d/%Y')
end

namespace :import do
  desc 'Import employee from csv file'
  task employees: [:environment] do
    # En dev on utilise un fichier de fixtures
    # TODO: faire le process pour la production
    ImportEmployeesService.call(file: 'ressources/employes.csv')
  end

  desc "Import des modèles d'entretiens"
  task review_templates: [:environment] do
    Reviews::ImportReviewTemplatesService.call
  end

end

