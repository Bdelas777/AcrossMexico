//
//  SwiftUIView.swift
//  
//
//  Created by Alumno on 24/01/24.
//

import SwiftUI

struct PageView: View {
    var page:Page
    var body: some View {
        Text(page.name)
            .font(.title)
            .bold()
        Spacer()
        Image("\(page.imageUrl)")
            .resizable()
            .scaledToFit()
            .padding()
            .cornerRadius(30)
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
            .frame(width: 600, height: 500)
        Spacer()
        
        Text(page.description)
            .font(.title2)
            .frame(width: 500)
        Spacer()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
