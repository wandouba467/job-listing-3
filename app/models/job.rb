class Job < ApplicationRecord
  has_many :resumes
  def publish!
    self.is_hidden = false
    self.save
  end
  def hide!
    self.is_hidden = true
    self.save
  end
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  validates :city, presence: true
  validates :category, presence: true
  validates :city, presence: true
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
end
