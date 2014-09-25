class User < ActiveRecord::Base
  authenticates_with_sorcery!

  ROLES = %w(admin editor author intern)

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

end
