Trestle.resource(:apis) do
    menu do
      group :applications, priority: :first do
        item :"Annual Person Interview", icon: "fa fa-handshake"
      end
    end
    form do |empid|
        text_field :api_M1
        select :user, User.all

    end  
    controller do
      def new
        
        super
      end
      def build_instance
        binding.pry
        admin.build_instance({api_M1:User.find_by(mat_hr:4040),user:User.find(1)}, params)
        self.instance = admin.build_instance(resource_params, params)
      end
    end

  end


