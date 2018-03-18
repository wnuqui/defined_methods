module DefinedMethods
  module Instance
    class << self
      def methods_defined_in(object)
        {
          object_name: object.to_s,
               object: object,
              methods: object.instance_methods(false) - object.protected_instance_methods(false),
              private: false,
            protected: false,
            singleton: false
        }
      end

      def private_methods_defined_in(object)
        {
          object_name: object.to_s,
               object: object,
              methods: object.private_instance_methods(false),
              private: true,
            protected: false,
            singleton: false
        }
      end

      def protected_methods_defined_in(object)
        {
          object_name: object.to_s,
               object: object,
              methods: object.protected_instance_methods(false),
              private: false,
            protected: true,
            singleton: false
        }
      end
    end
  end
end