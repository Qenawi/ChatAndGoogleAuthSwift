//
//  Chat.swift
//  chat_app_medium
//
//  Created by Qenawi on 9/26/20.
//  Copyright © 2020 goplus. All rights reserved.
//

import Foundation
struct Chat {
var users: [String]
var dictionary: [String: Any] {
return ["users": users]
   }
}

extension Chat {
init?(dictionary: [String:Any]) {
guard let chatUsers = dictionary["users"] as? [String] else {return nil}
self.init(users: chatUsers)
}
}
