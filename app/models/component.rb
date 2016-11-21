class Component < ActiveRecord::Base
  belongs_to :product

  validates :name, format: {with: /paper|envelope/i, message: "must be either *paper* or *envelope*!"}
  validates :coverage, presence: true

  before_validation :set_kind

  scope :papers, -> { where(kind: 'p') }
  scope :envelopes, -> { where(kind: 'e') }

  private
  def set_kind
    byebug
    case name.downcase[/paper|envelope/i]
    when 'paper'
      self.kind = "p"
    when 'envelope'
      self.kind = "e"
    end
  end
end
