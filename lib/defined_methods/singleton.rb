module DefinedMethods
  module Singleton
    NOT_INCLUDED_PRIVATE_METHODS = %i[
      inherited
      initialize
      attr_reader
      attr
      attr_accessor
      attr_writer
      remove_const
      extend_object
      append_features
      prepend_features
      undef_method
      method_added
      method_removed
      remove_method
      method_undefined
      alias_method
      public
      private
      initialize_copy
      initialize_clone
      protected
      included
      extended
      prepended
      define_method
      refine
      using
      module_function
    ]

    class << self
      def methods_defined_in(object)
        {
          object_name: object.to_s,
               object: object.singleton_class,
              methods: object.methods(false) - object.protected_methods(false),
              private: false,
            protected: false,
            singleton: true
        }
      end

      def private_methods_defined_in(object)
        {
          object_name: object.to_s,
               object: object.singleton_class,
              methods: object.private_methods(false) - NOT_INCLUDED_PRIVATE_METHODS - methods_from_extended_modules(object) - methods_from_ancestors(object),
              private: true,
            protected: false,
            singleton: true
        }
      end

      def protected_methods_defined_in(object)
        {
          object_name: object.to_s,
               object: object.singleton_class,
              methods: object.protected_methods(false) - methods_from_extended_modules(object) - methods_from_ancestors(object),
              private: false,
            protected: true,
            singleton: true
        }
      end

      private

      def methods_from_extended_modules(object)
        extended_modules = object.singleton_class.included_modules - [Kernel]
        methods = []

        extended_modules.each do |mod|
          methods = methods + mod.instance_methods(false) + mod.private_instance_methods(false)
        end

        methods.flatten.uniq
      end

      def methods_from_ancestors(object)
        ancestors = object.ancestors - [object, Object, Kernel, BasicObject]
        methods = []

        ancestors.each do |mod|
          methods = methods + mod.protected_methods(false) + mod.private_methods(false)
        end

        methods.flatten.uniq
      end
    end
  end
end