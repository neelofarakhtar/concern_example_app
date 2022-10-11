module Visible
  extend ActiveSupport::Concern

  # The code inside the included block is evaluated
  # in the context of the class that includes the Visible concern.
  # You can write class macros here, and
  # any methods become instance methods of the including class.
  included do
    attr_accessor :visible_to

    def is_visible?
      visible_to.present?
    end
  end

  # The methods added inside the class_methods block (or, ClassMethods module)
  # become the class methods on the including class.
  class_methods do
    def count_all_visible
      all.select { |item| item.is_visible? }
    end
  end
end