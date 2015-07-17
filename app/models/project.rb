class Project < ActiveRecord::Base
  validates_presence_of :name, null: false
  validates :name, uniqueness: true
  has_many :users, -> { uniq }, through: :project_users
  has_many :project_users
  belongs_to :skill
  belongs_to :user
end
