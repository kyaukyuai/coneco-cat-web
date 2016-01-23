require_relative '../../app/models/cat.rb'
require 'net/http'
require 'uri'
require 'json'
require 'logger'
$log = Logger.new(STDOUT)

# constant variable
CONSUMER_KEY = 'wso0y9t1n3iVnqo8DYQzbfrgaqACNAzaz09bcRwe'
IMAGE_SIZE = 3

class Tasks::FetchPxCats
  def self.execute
    term_array = %w(ねこ 猫 ネコ cat)
    term = term_array.sample
    sort_array = %w(favorites_count _sort rating highest_rating times_viewed)
    sort = sort_array.sample
    $log.info(%Q{#{term}/#{sort}})
    call_uri = URI.parse(URI.escape(%Q(https://api.500px.com/v1/photos/search?consumer_key=#{CONSUMER_KEY}&image_size=#{IMAGE_SIZE}&term=#{term}&sort=#{sort})))
    res = Net::HTTP.get_response(call_uri)
    results = JSON.parse(res.body)
    total_pages = results['total_pages']
    (1..total_pages.to_i).each do |index|
      call_uri = URI.parse(URI.escape(%Q(https://api.500px.com/v1/photos/search?consumer_key=#{CONSUMER_KEY}&image_size=#{IMAGE_SIZE}&term=#{term}&sort=#{sort}&page=#{index})))
      res = Net::HTTP.get_response(call_uri)
      results = JSON.parse(res.body)
      insert_cat(results)
      sleep 10
    end
  end

  def self.insert_cat(results)
    if results['photos'].present?
      results['photos'].each do |photo|
        Cat.find_or_create_by(site_id: photo['id']) do |cat|
          cat.site_id = photo['id']
          cat.name = photo['name']
          cat.description = photo['description']
          cat.keyword = ''
          cat.link_url = %Q{https://500px.com#{photo['url']}}
          cat.image_url = photo['image_url']
          cat.userid = photo['user']['id']
          cat.username = photo['user']['username']
          cat.userpic_url = photo['user']['userpic_url']
          cat.like_count = photo['favorites_count']
          cat.comment_count = photo['comments_count']
          cat.posted_at = photo['created_at']
        end
      end
    end
  end
end

__END__

bundle exec rails runner Tasks::FetchInstagramCats.execute

mysql> desc instagram_cats;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int(11)      | NO   | PRI | NULL    | auto_increment |
| instagram_id | int(11)      | YES  | UNI | NULL    |                |
| text         | varchar(255) | YES  |     | NULL    |                |
| image_url    | varchar(255) | YES  |     | NULL    |                |
| tags         | varchar(255) | YES  |     | NULL    |                |
| userid       | int(11)      | YES  |     | NULL    |                |
| username     | varchar(255) | YES  |     | NULL    |                |
| userpic      | varchar(255) | YES  |     | NULL    |                |
| created_at   | datetime     | NO   |     | NULL    |                |
| updated_at   | datetime     | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)
