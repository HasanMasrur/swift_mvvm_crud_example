//
//  PostModel.swift
//  api_call
//
//  Created by Hasan Masrur on 2/2/25.
//

import Foundation

struct PostModel: Codable , Identifiable{
    let id: Int
    let title: String
    let body: String
}
