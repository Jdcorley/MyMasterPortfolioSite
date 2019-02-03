class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                           reject_if: lambda { |attrs| attrs['name'].blank? }
  has_one_attached :main_image
  has_one_attached :thumb_image
  validates_presence_of :title, :body

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

  def main_image_url
    if self.main_image.attachment
      self.main_image.attachment.service_url
    end
  end

  def thumb_image_url
    if self.thumb_image.attachment
      self.thumb_image.attachment.service_url
    end
  end
end
