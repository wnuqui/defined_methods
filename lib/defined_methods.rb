require 'defined_methods/version'
require 'defined_methods/singleton'
require 'defined_methods/instance'

module DefinedMethods
  class << self
    def in(object)
      [
        Singleton.methods_defined_in(object),
        Singleton.private_methods_defined_in(object),
        Singleton.protected_methods_defined_in(object),
        Instance.methods_defined_in(object),
        Instance.private_methods_defined_in(object),
        Instance.protected_methods_defined_in(object)
      ]
    end

    def fqmn(group, method)
      separator = group[:singleton] ? '.' : '#'
      group[:object_name] + separator + method.to_s
    end
  end
end
