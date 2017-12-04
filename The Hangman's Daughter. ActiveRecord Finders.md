# The Hangman's Daughter. ActiveRecord Finders
```ruby
# Deprecated in Rails 4
Post.find(:all, conditions: { author: 'admin' } )

Post.where(author: 'admin')

# Deprecated in Rails 4
Post.find_all_by_title('Rails 4')
Post.find_last_by_author('admin')

Post.where(title: 'Rails 4')
Post.where(author: 'admin').last

# Rails 3 & 4
Post.find_by_title('Rails 4')

Post.find_by(title: 'Rails 4')

# Deprecated in Rails 4
Post.find_by_title('Rails 4', conditions: { author: 'admin'} )

Post.find_by(title: 'Rails 4', author: 'admin')

post_params = { title: 'Rails 4', author: 'admin' }
Post.find_by(post_params)

Post.find_by("published_on < ?", 2.weeks.ago)

# Deprecated in Rails 4
Post.find_or_initialize_by_title('Rails 4')
Post.find_or_create_by_title('Rails 4')

Post.find_or_initialize_by(title: 'Rails 4')
Post.find_or_create_by(title: 'Rails 4')

# Rails 3 & 4
Post.where(title: 'Rails 4').first_or_create

Post.find_or_create_by(title: 'Rails 4')

# Rails 3
@post.update_attributes(post_params)
@post.update_attributes(:title, 'Rails 4')
@post.update_column(:title, 'Rails 4')

@post.update(post_params)
@post.update_columns(post_params)

# Rails 3
@tweets.scoped 

def index
  @tweets = Tweet.scoped
  if params[:recent]
    @tweets = @tweets.recent
  end
end


@tweets = Tweet.all

def index
  @tweets = Tweet.all
  if params[:recent]
    @tweets = tweets.recent
  end
end

```