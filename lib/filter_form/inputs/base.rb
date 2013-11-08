module FilterForm
  module Inputs
    class Base
      include ActiveModel::Model

      attr_accessor :attribute_name, :object, :predicate

      def options
        {
          required:   false,
          input_html: { name: input_name }
        }
      end

    private

      def input_name
        "q[#{ attribute_name }_#{ predicate }]"
      end

      def input_value
        object_condition.values.first.value if object_condition
      end

      def object_condition
        object.base.conditions.select { |c| c.a.first.name == attribute_name.to_s }.first
      end
    end
  end
end
