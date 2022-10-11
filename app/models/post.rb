class Post < ApplicationRecord
   include Visible
  belongs_to :author
   has_many :comments, dependent: :delete_all

  validates :title, presence: true, length: { minimum: 2 }
  validate :has_valid_content

  attr_accessor :visible_to

  def is_visible?
    visible_to.present?
  end

  def has_valid_content
    # some code
  end

  def self.count_all_visible
    all.select { |item| item.is_visible? }
  end
end
end
