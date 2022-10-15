module Devisable
  extend ActiveSupport::Concern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  included do
    validates :phone,:presence => true,
              :numericality => true,
              :length => { :minimum => 10, :maximum => 15 }

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    def email_required?
      false
    end
    
    def email_changed?
      false
    end

  end
 
end