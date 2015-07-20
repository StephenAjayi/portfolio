class Project < ActiveRecord::Base
  belongs_to :skill

  validates :name, :presence => true
  validates :description, :presence => true
  validates :url, :presence => true
end
