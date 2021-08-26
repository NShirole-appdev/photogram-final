class UsersController < ApplicationController

def index
  @users = User.all.order({ :username => :asc })

  render({ :template => "users/index.html.erb" })
end


def show
  the_username = params.fetch("the_username")
  @user = User.where({ :username => the_username }).at(0)

  render({ :template => "users/show.html.erb" })
end

def feed
  the_username = params.fetch("the_username")
  @user = User.where({ :username => the_username }).at(0)

  feed_users = []
  FollowRequest.where({ :sender_id => @user.id }).where({ :status => "accepted" }).each do |follow|
   feed_users.push(follow.recipient_id)
  end

  @feed_photos = Photo.where({ :owner_id => [feed_users]}).order({ :created_at => :desc })

  render({ :template => "users/feed.html.erb" })
end

end