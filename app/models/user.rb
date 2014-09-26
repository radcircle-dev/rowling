class User < ActiveRecord::Base
  authenticates_with_sorcery!
  ROLES = %w(admin editor author intern standard)

  validates :name, :email, presence: true
  validates :role, inclusion: { in: ROLES }, allow_blank: true

  def admin?
    role == 'admin'
  end

  def editor?
    role == 'editor'
  end
  
  def author?
    role == 'author'
  end

  def intern?
    role == 'intern'
  end
  
  def standard?
    role == 'standard'
  end

end
