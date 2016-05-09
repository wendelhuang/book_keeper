class RecordType < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  #belongs_to :account_record
  has_many :account_record
  
  scope :sorted, lambda { order("#{table_name}.updated_at DESC") }
  scope :title_exist, lambda { |title| where(:title => title) }

  def self.create(title, user_id)
    record_type = RecordType.new
    record_type.title = title
    record_type.user_id = user_id
    record_type.save
    return record_type
  end
end
