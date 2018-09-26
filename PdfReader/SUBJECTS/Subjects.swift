//  DataModel.swift
//  PdfReader
//  Created by Bhanu Pratap Singh Thapliyal on 12/09/18.

import Foundation

class Subjects {
    var id: String!
    var SubjectName: String!
    
    init(title: String) {
        self.id = UUID().uuidString
        self.SubjectName = SubjectName
    }
}
