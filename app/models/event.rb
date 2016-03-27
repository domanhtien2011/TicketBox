class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types


  validates_associated :ticket_types
  validates_presence_of :user

  validates_presence_of  :name, :extended_html_description, :hero_image_url
  # validates_presence_of :venue, :category

  validates_uniqueness_of :name,scope: [:venue_id, :starts_at]

  def has_ticket_types?
    !!self.ticket_types.present?
  end

  def self.search(search)
    where('LOWER(name) LIKE ? OR LOWER(extended_html_description) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
  end

  def self.check_event_validation
     where('starts_at > ?', Time.now)
  end
end
