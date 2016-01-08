class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_and_belongs_to_many  :categories
  accepts_nested_attributes_for :categories, :reject_if => :all_blank, :allow_destroy => true
end
