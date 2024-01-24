class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :timeoutable, :trackable and :omniauthable
  has_many :tasks
  has_many :bugs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:timeoutable
         enum role: {developer:0, QA:1, manager:2}





         
        #  def manager?
        #   user_type == 'manager'
        #  end
        #  def developer?
        #   user_type == 'developer'
        #  end
        #  def QA?
        #   user_type == 'QA'
        #  end


        # def manager?(user)
        #   if user.role == 2
        #     return true
        #   end
        # end
      
        # def QA?(user)
        #   if user == current_user
        #     user.role = 1
        #     return true
        #   end
        # end   
      
        # def developer?(user)
        #   if user != current_user && user.role != 2
        #     user.role = 0 
        #     return true
        #   end 
        # end
         
end
