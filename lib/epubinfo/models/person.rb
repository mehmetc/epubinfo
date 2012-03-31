module EPUBInfo
  module Models
    class Person
      attr_accessor :name, :file_as, :role

      def initialize(node)
        self.name = node.content
        self.file_as = node.attribute('file-as').content rescue nil
        self.role = node.attribute('role').content rescue nil
      end
    end
  end
end
