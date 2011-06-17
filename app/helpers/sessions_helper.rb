module SessionsHelper
  def has_voted(user_id, snippet_id)
    vote = Vote.where(["user_id = ? AND snippet_id = ?", user_id, snippet_id]).first
  end
end
