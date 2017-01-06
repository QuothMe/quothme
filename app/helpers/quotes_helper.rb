module QuotesHelper

 def display_likes(quote)
    votes = quote.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end



  private

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.username,
                                user_path(voter.username),
                                class: 'username')
      end
      votes.count.to_s + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' people like this' if votes.count > 1
    ' person likes this'
  end

end
