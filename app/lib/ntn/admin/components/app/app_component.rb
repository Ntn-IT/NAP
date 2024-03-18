# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module App
        class AppComponent < ::Ntn::Component
          configure(
            title: false,
            menu: false,
            env: Rails.env
          )

          def build_menu(items = menu)
            build(
              items.map do |item|
                next tag.li { build(item) } if component?(item)

                raise 'Menu item must be a Component or a Hash' unless item.is_a?(Hash)

                if item.key?(:group) && item.key?(:items)

                  anchor = item[:group].underscore

                  next tag.ul(data: { group: anchor }) do
                    build(
                      [
                        tag.li(class: 'nav-header') do
                          build(
                            link(text: item[:group], url: "##{anchor}")
                          )
                        end,
                        *build_menu(item[:items])
                      ]
                    )
                  end
                end

                raise 'Missing key `url`' unless item.key?(:url)
                raise 'Missing key `content`' unless item.key?(:content)

                tag.li do
                  build(
                    link(url: item[:url]) do
                      build(
                        [
                          tag.i(class: "nav-icon #{item[:icon]}"),
                          tag.span(class: 'nav-label') { item[:content] }
                        ]
                      )
                    end
                  )
                end
              end
            )
          end
        end
      end
    end
  end
end
