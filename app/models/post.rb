class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  VALIDARR = ["Won't", "Believe", "Secret", "Top", "Guess"]

  def clickbait
    if self.title
      if !self.title.split(" ").any? { |word| VALIDARR.include?(word) }
        errors.add(:clickbait, "This is not clickbait")
      end
    end
  end
end
