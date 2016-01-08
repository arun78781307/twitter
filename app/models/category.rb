class Category < ActiveRecord::Base

  has_and_belongs_to_many :news

  has_and_belongs_to_many :users

  accepts_nested_attributes_for :news, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :users, :reject_if => :all_blank, :allow_destroy => true
end
