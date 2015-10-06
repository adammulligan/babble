require 'sinatra'

require 'easy_translate'
EasyTranslate.api_key = ENV['TRANSLATE_TOKEN']

InvalidTokenError = Class.new(Exception)

get '/' do
  raise(InvalidTokenError) unless params[:token] == ENV['SLACK_TOKEN']
  text = params.fetch('text').strip
  return EasyTranslate.translate(text, :from => :spanish, :to => :en)
end

run Sinatra::Application

