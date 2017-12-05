# The Hangman's Daughter. ActiveModel
```ruby
# Deprecated in Rails 4
scope :sold, where(state: 'sold')
default_scope where(state: 'available')

scope :sold, ->{ where(state: 'sold') }

# Passing block
default_scope { where(state: 'available') }
# Passing proc object
default_scope -> { where(state: 'available') }

# The date is only resolved once, on class load
scope :recent, where(published_at: 2.weeks.ago)

scope :recent, ->{ where(published_at: 2.weeks.ago) }
# This forces previous scope to resolve the date on class load
scope :recent_red, recent.where(color: 'red')

class User < ActiveRecord::Base
  def visible_posts
    case role
    when 'Country Manager'
      Post.where(country: country)
    when 'Reviewer'
      Post.published
    when 'Bad User'
      # Represents empty collection
      []
    end
  end
end

@posts = current_user.visible_posts
# This generates error when Bad User!
@posts.recent

# Must check for presence?
if @posts.any?
  @posts.recent
else
  # Must return empty collection to caller
  []
end

# In Rails 4

class User < ActiveRecord::Base
  def visible_posts
    case role
    when 'Country Manager'
      Post.where(country: country)
    when 'Reviewer'
      Post.published
    when 'Bad User'
      Post.none
    end
  end
end

@posts = current_user.visible_posts
# No need to check for presence
@posts.recent


# In Rails 3
# When author is nil generates incorrect SQL syntax
Post.where('author != ?', author)

# Workaround is too verbose
if author
  Post.where('author != ?', author)
else
  Post.where('author IS NOT NULL')
end

# In Rails 4
# When author is nil generates correct SQL syntax
Post.where.not(author: author)

# In Rails 3
class User < ActiveRecord::Base
  default_scope { order(:name) }
end
# Generates the following SQL:
# SELECT * FROM users ORDER BY name asc, created_at desc
# New calls to order are appended
User.order("created_at DESC")

# In Rails 4 generates following SQL:
# SELECT * FROM users ORDER BY created_at desc, name asc
# New calls to order are prepended

# In Rails 3
User.order(:name, 'created_at DESC')

#In Rails 4
# Generates this SQL:
# SELeCT * FROM users ORDER BY name asc, created_at desc
User.order(:name, created_at: :desc)

# In Rails 3
User.order('created_at DESC')

# In Rails 4
# Generates this SQL:
# SELECT * FROM users ORDER BY crated_at desc
User.order(created_at: :desc)

# In Rails 3
Post.includes(:comments).where("comments.name = 'foo'")

# In Rails 4
Post.includes(:comments).where("comments.name = 'foo'").references(:comments)

# Hash-based conditions do not need referencing
Post.includes(:comments).where(comments: { name: 'foo' })
Post.includes(:comments).where('comments.name' => 'foo')

# In case there is no condition, referencing is not needed
Post.includes(:comments).order('comments.name')

# In Rails 3
class SupportTicket
  include ActiveModel::Conversation
  include ActiveModel::Validations
  include ActiveModel::Naming
  
  attr_accessor :title, :description
  
  validates_presence_of :title
  validates_presence_of :description
end

form_for(@support_ticket) do |f|
  ...
end

# Behaves like an ActiveRecord model
SupportTicket.new(support_params)
@support_ticket.valid?
@support_ticket.errors
@support_ticket.to_param

# In Rails 4
class SupportTicket
  # Shorter version
  include ActiveModel::Model
  
  attr_accessor :title, :description
  
  validates_presence_of :title
  validates_presence_of :description
end

```