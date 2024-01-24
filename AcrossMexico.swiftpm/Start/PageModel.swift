//
//  File.swift
//  
//
//  Created by Alumno on 24/01/24.
//

import Foundation

struct Page: Identifiable,Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Example", description: "Description", imageUrl: "Mexico", tag: 0)
    
    static var samplePages: [Page] = [
    
        Page(name: "Welcome to AcrossMexico", description: "My name is Bernardo and I am from Mexico. This app is about my experience living in 6 different cities and states in Mexico. ", imageUrl: "AroundMexico", tag: 0),
        Page(name: "Discover Mexico", description: "In this application I will tell you a typical food of each state, an unknown place that can be visited and a curiosity of the city.", imageUrl: "TravelMexico", tag: 1),
        Page(name: "Join me", description: "Discover a new part of Mexico that you didn't know about", imageUrl: "Mexico", tag: 1)
    
    ]
    
}
