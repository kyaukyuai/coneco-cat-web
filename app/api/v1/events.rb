module V1
  class Events < Grape::API
    resource :events do

      desc 'Good cat.'
      params do
        requires :cat_id, type: Integer, desc: 'Cat ID'
      end
      post 'good' do
        authenticate_user!
        p params[:cat_id]
        cat = InstagramCat.find(params[:cat_id])
        p cat
        cat[:fav_count] += 1
        cat.save!
        status 201
      end

      desc 'Bad cat.'
      params do
        requires :cat_id, type: Integer, desc: 'Cat ID'
      end
      post 'bad' do
        authenticate_user!
        cat = InstagramCat.find(params[:cat_id])
        cat[:fav_count] -= 1
        cat.save!
        status 201
      end

    end
  end
end