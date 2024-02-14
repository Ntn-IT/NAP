Trestle.admin(:dashboard) do
    menu do
      item :dashboard, icon: "fa fa-tachometer"
    end
  
    controller do
      def index
        @missing_warhead_count = Warhead.missing.count
      end
    end
  end