class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_associated :ticket_types

  validates_presence_of  :name, :extended_html_description, :hero_image_url, :venue, :category, :starts_at,  :ends_at

  validates_uniqueness_of :name, uniqueness: { scope: [:venue, :starts_at] }

  def has_ticket_types?
    !!self.ticket_types.present?
  end
end
