class Reservation < ApplicationRecord
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :people, presence: true

  validate :start_end_check
  def start_end_check
    if start_day.present? && end_day.present?
      errors.add(:end_day, "はチェックイン日より後の日付で選択してください。") unless
      self.start_day <= self.end_day 
    end
  end

  belongs_to :user
  belongs_to :room
end
