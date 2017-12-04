# A Bloody Tale of Revenge
```ruby
# It's not a good idea
match '/items/:id/purchase', to: 'items#purchase'

post '/items/:id/purchase', to: 'items#purchase'
match '/items/:id/purchase', to: 'items#purchase', via: :post

match '/items/:id/purchase', to: 'items#purchase', via: :all
```

```html
<form>
  <div style="margin: 0;padding: 0;display: inline">
    <input name="utf8" type="hidden" value="&#x2713;" />
    <input name="_method" type="hidden" value="patch" />
  </div>
</form>

```

```ruby
resources :messages do
  resources :comments
  resources :categories
  resources :tags
end

resources :posts do
  resources :comments
  resources :categories
  resources :tags
end

resources :items do
  resources :comments
  resources :categories
  resources :tags
end

# This is better
concern :sociable do
  resources :comments
  resources :categories
  resources :tags
end

resources :messages, concerns: :sociable
resources :categories, concerns: :sociable
resources :tags, concerns: :sociable

# It can be parametric
concern :sociable do |options|
  resources :comments, options
  resources :categories, options
  resources :tags, options
end

resources :messages, concerns: :sociable
resources :categories, concerns: :sociable
resources :tags do
  concerns :sociable, only: :create
end

# Also it can be used like this
class Sociable
  def self.call(mapper, options)
    mapper.resources :comments, options
    mapper.resources :categories, options
    mapper.resources :tags, options
  end
end

concern :sociable, Sociable
resources :messages, concerns: :sociable
resources :categories, concerns: :sociable
resources :tags do
  concerns :sociable, only: :create

```