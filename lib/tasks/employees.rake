# frozen_string_literal: true

namespace :employees do
  desc 'Import employee from csv file'
  task import: [:environment] do
    # En dev on utilise un fichier de fixtures
    # TODO: faire le process pour la production
    ImportEmployeesService.call(file: 'ressources/employes.csv')
  end
end
