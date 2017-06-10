class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.find_or_create_by(params[:figure])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !!params[:landmark][:name]
    @figure.titles << Title.find_or_create_by(params[:title]) if !!params[:title][:name]
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    

    redirect to "/figures/#{params[:id]}"
  end
end


