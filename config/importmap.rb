# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

pin 'trestle/admin', preload: true

components_path = Rails.root.join('app/lib/ntn/admin/components')
components_path.glob('**/*.js').each do |file|
  name = file.relative_path_from(components_path).to_s.remove(/\.js$/)
  pin "components/#{file.basename.to_s.gsub(/.js$/, '')}", to: name
end
