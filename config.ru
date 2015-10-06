require 'sinatra'

require 'easy_translate'
EasyTranslate.api_key = ENV['TRANSLATE_TOKEN']

InvalidTokenError = Class.new(Exception)

get '/' do
  raise(InvalidTokenError) unless params[:token] == ENV['SLACK_TOKEN']
  text = params.fetch('text').strip

  to = params.fetch('language_to', :en)

  return EasyTranslate.translate(text, :to => to)
end

run Sinatra::Application

