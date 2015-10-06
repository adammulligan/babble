require 'sinatra'

require 'easy_translate'
EasyTranslate.api_key = ENV['TRANSLATE_TOKEN']

InvalidTokenError = Class.new(Exception)
TooLongError = Class.new(Exception)

get '/' do
  raise(InvalidTokenError) unless (params[:token] == ENV['SLACK_TOKEN1']) || (params[:token] == ENV['SLACK_TOKEN2'])

  text = params.fetch('text').strip
  raise(TooLongError) if text.length > 1000

  to = params.fetch('language_to', :en)

  return EasyTranslate.translate(text, :to => to)
end

run Sinatra::Application

