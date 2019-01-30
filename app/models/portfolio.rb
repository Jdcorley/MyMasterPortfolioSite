class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                           reject_if: lambda { |attrs| attrs['name'].blank? }
  has_one_attached :featured_image_thumb
  has_one_attached :featured_image
  include Placeholder
  validates_presence_of :title, :body

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.featured_image ||= Placeholder.image_generator(height: '600',width: '400')
    self.featured_image_thumb ||= Placeholder.image_generator(height: '350',width: '200')
  end

  def featured_image_url
    if self.featured_image.attachment
      self.featured_image.attachment.service_url
    end
  end

  def featured_image_thumb_url
    if self.featured_image_thumb.attachment
      self.featured_image_thumb.attachment.service_url
    end
  end
end
