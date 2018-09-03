class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    if self.title == nil
      errors.add(:title, "error")
    elsif ["Won't Believe", "Secret", "Top [number]", "Guess"].none? do |item|
      (self.title).include?(item)
    end == true
      errors.add(:title, "error")
    end
  end

end
