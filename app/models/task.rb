class Task < ApplicationRecord
#おためしstart
# もし「なまえ」がnilだった場合、validationするまえに「なまえなし」を設定する
#  before_validation :set_nameless_name
#おためしend

  has_one_attached :image
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    # 検索対象にすることを許可するカラムを指定する
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    # 検索条件に含める関連を指定。
    # 空の配列を返すことで、検索条件に意図しない関連を含めないようにする
    []
  end

  private

  def validate_name_not_including_comma
    #nameがnilの時はOKにするために&.をつかってる。nilなら必須チェックでひっかかる。
    errors.add(:name, 'にカンマをふくむことはできないのです') if name&.include?(',')
  end

  #おためしstart
  #  def set_nameless_name
  #    self.name = 'なまえなし' if name.blank?
  #  end
  #おためしend
end
