class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    class_eval %Q{
      def #{attr_name}_history    # create bar_history getter
        @#{attr_name}_history || [nil]
      end

      def #{attr_name}= val     # create the attribute's setter
        @#{attr_name}_history ||= [nil]
        @#{attr_name}_history << val
        @#{attr_name} = val
      end
    }
  end
end
