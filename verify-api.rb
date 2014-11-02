require 'grape'
require_relative 'client'

class Verify < Grape::API
  format :json
  prefix :api

  get '/check-status/:aba/:account_number/:amount' do
    result = AccountStatus.verify params[:aba], params[:account_number], params[:amount]
    {result: result}
  end

end