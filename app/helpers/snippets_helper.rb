module SnippetsHelper
  def saved(snippet_id)
    s=Save.where(:snippet_id=>snippet_id, :user_id=>current_user.id)
    if s.empty?
      return false
    else
      return true
    end
  end
end
