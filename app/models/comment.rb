class Comment < ApplicationRecord
  belongs_to :post
   validates :commenter, :body, presence: true

  attr_accessor :visible_to

  def is_visible?
    visible_to.present?
  end

  def self.count_all_visible
    all.select { |item| item.is_visible? }
  end
end
