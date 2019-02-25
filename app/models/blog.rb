class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic, optional: true

  has_many :comments, dependent: :destroy

  def self.latest_first
    order('created_at desc')
  end
end
