require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///database.db'

configure do
  defaults = 
    { nsfwFilter: 1,
      numLinks: 20,
      badtags: [] }
  set :defaults, defaults
end

class User < ActiveRecord::Base
  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, :through => :post_tags

  def self.search(s)
    # TODO: size, order
    # TODO: anything other than positive AND search terms
    if s[:q].present? 
      and_tags = s[:q].split(',').map(&:strip)
      joins(:tags).where(:tags => {:tag => and_tags}).having('COUNT(*) = ?', and_tags.length).group(:id)
    end
    .where("nsfw <= ?", 2 - s[:nsfw].to_i)
    .limit(s[:numLinks])
  end
end

class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag #ehhhhhh
end

class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags
end

get '/request' do
  searchHash = params
  searchHash[:nsfw] ||= settings.defaults[:nsfwFilter]
  searchHash[:order] ||= 0
  searchHash[:numLinks] ||= settings.defaults[:numLinks]
  Post.search(searchHash).to_json
end
