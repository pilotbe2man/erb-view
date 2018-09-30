require 'erb/view/version'
require 'erb'
require 'pathname'

module Erb
  def root=(path)
    @root = Pathname.new(path).expand_path
  end

  def root
    @root ||= Pathname.new(__FILE__).join('../../lib/templates')
  end
  module_function :root, :root=

  module View
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def template(name = nil)
        if name
          @template = name
        else
          @template
        end
      end

      def exposes(keys = nil)
        @exposes ||= []

        if keys
          @exposes.concat(Array(keys))
        else
          @exposes
        end
      end
    end

    def initialize
      self.class.exposes.each do |method|
        next if respond_to?(method)
        define_singleton_method(method) do
          @data.fetch(method)
        end
      end
    end

    def render(data = {})
      @data = data
      erb(self.class.template.to_s).result(binding)
    end

    private

    def erb(template)
      ERB.new(File.read(root.join("#{template}.erb")))
    end

    def root
      Erb.root
    end
  end
end
