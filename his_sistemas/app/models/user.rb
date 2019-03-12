class User < ApplicationRecord
	belongs_to :user_type, dependent: :destroy, autosave: true
	belongs_to :contact, dependent: :destroy, autosave: true
	
	accepts_nested_attributes_for :contact
	accepts_nested_attributes_for :user_type


	after_initialize do
		build_contact if new_record? && contact.blank?
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end