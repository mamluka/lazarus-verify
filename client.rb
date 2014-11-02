require 'savon'
require 'hashie/mash'

class AccountStatus

  $client = Savon.client(wsdl: 'http://www.lyonsreg.com/webservices/atm/ATMService.asmx?WSDL')

  def self.verify(aba, account, amount)

    response = $client.call :logon, message: {companyID: '3290', userName: 'grX6g9zp', password: '3J6EJNdF'}
    token = response.body[:logon_response][:logon_result]

    response = $client.call :get_status_code_v2, message: {aba: aba, account: account, amount: amount, present: 0, token: token}
    status_code = response.body[:get_status_code_v2_response][:get_status_code_v2_result]
    response = $client.call :translate_status_code, message: {token: token, code: status_code.to_i}

    response.body[:translate_status_code_response][:translate_status_code_result]

  end
end

