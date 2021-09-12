class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'

  get '/bakeries' do
   # get all the bakeries from the database
   bakeries = Bakery.all
    # send them back as a JSON array
  bakeries.to_json
  end
  get '/bakeries/:id' do
    # get all the bakeries from the database
    bakery = Bakery.find(params[:id])
     # send them back as a JSON array
   bakery.to_json(include: :baked_goods) 
   end
  get '/baked_goods/by_price' do
    baked_goods=BakedGood.by_price
    baked_goods.to_json
  
  end

  get '/baked_goods/most_expensive' do
    baked_good=BakedGood.by_price.first
    baked_good.to_json
  
  end
  #  get '/games/:id' do
  #   # look up the game in the database using its ID
  #   game = Game.find(params[:id])
  #   # send a JSON-formatted response of the game data
  #   game.to_json(only: [:id, :title, :genre, :price], include: {
  #     reviews: { only: [:comment, :score], include: {
  #       user: { only: [:name] }
  #     } }
  #   })
  # end

end
