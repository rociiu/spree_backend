module Spree
  module Admin
    module StoresHelper
      def selected_checkout_zone(store)
        store&.checkout_zone || Spree::Zone.default_checkout_zone
      end

      def stores_dropdown_values
        formatted_stores = []

        @stores.map { |store| formatted_stores << [store.unique_name, store.id] }

        formatted_stores
      end

      def store_switcher_link(store)
        if current_store.id == store.id
          classes = 'disabled bg-light'
          icon = svg_icon name: 'circle-fill.svg', width: '18', height: '18'
        else
          classes = nil
          icon = svg_icon name: 'circle.svg', width: '18', height: '18'
        end

        link_to icon + store.unique_name, spree.admin_url(host: store.formatted_url),
                class: "#{classes} py-2 px-4 my-1 dropdown-item", id: store.code, data: { turbo: false }
      end
    end
  end
end
