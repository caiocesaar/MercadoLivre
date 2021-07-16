//
//  RequestError.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import Foundation

// Enum with the possible errors that might happens during the request response
enum RequestError:Error {
    case unknownReason
    case sessionExpired
    case noInternetConnection
    case failure(reason:String?, code:String?)
}

// As RequestError is an instance of error, we parse the errors response to RequestError and get the
// possible messages
extension Error{
    
    /// Returns the error message for the RequestError
    var requestMessage:String {
        get{
            if !getCode().isEmpty{
                return "Code:\(getCode())\n\n\(getReason())"
            }
            return getReason()
        }
    }
    
    /// Returns the error code for the RequestError
    var requestCode:String{
        get{
            return getCode()
        }
    }
    
    /// Checks if the error is instance of RequestError and returns the message related to it
    private func getReason()->String{
        guard let requestError = self as? RequestError else{
            return ""
        }
        switch requestError {
            case .failure(let reason, _):
                return reason ?? ""
            case .noInternetConnection:
                return "Sem conexão com a internet."
            case .sessionExpired:
                return "Sessão expirada."
            default:
                return "Erro desconhecido"
        }
    }
    
    /// Checks if the error is instance of RequestError and returns the code related to it
    private func getCode()->String{
        guard let requestError = self as? RequestError else{
            return ""
        }
        switch requestError {
            case .failure(_, let code):
                return code ?? ""
            default:
                return ""
        }
    }
}
/// Class responsible for decoding the errors from the server
class ErrorFeedback: Codable{
    
    // MARK: - Variables
    // The code and message of the error
    var code:String?    = nil
    var message:String? = nil
    
    // Indicate if there is any error available
    var hasError:Bool{
        get{
            return message != nil
        }
    }
    
    // MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case code    = "code"
        case message = "message"
    }
    
    // MARK: - Inits
    init(){
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code    = try? container.decode(String.self, forKey: .code)
        message = try? container.decode(String.self, forKey: .message)
    }
}
