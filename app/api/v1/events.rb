module V1
  class Events < Grape::API
    resource :events do

      desc 'Good cat.'
      params do
        requires :cat_id, type: Integer, desc: 'Cat ID'
      end
      post 'good' do
        cat = InstagramCat.find(params[:cat_id])
        cat[:fav_count] += 1
        cat.save!
        cat[:text].force_encoding('UTF-8')
        cat[:tags].force_encoding('UTF-8')
        cat
      end

      desc 'Bad cat.'
      params do
        requires :cat_id, type: Integer, desc: 'Cat ID'
      end
      post 'bad' do
        cat = InstagramCat.find(params[:cat_id])
        cat[:fav_count] -= 1
        cat.save!
        cat[:text].force_encoding('UTF-8')
        cat[:tags].force_encoding('UTF-8')
        cat
      end

    end
  end
end
