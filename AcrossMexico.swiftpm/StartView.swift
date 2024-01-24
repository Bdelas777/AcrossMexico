//
//  StartView.swift
//  AcrossMexico
//
//  Created by Alumno on 24/01/24.
//

import SwiftUI

struct StartView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    var body: some View {
        
        TabView(selection: $pageIndex){
            
            ForEach(pages) { page in
                VStack{
                    Spacer()
                    PageView(page: page)
                   
                    if page == pages.last{
                        Button("Start", action: goToZero)
                            .buttonStyle(.bordered)
                            .font(.title2)
                        Spacer()
                    }else{
                        Button("Next", action: incrementPage)
                            .font(.title2)
                        Spacer()
                    }//End IF
                }// End VSTACK
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    
    func incrementPage(){
        pageIndex += 1
    }
    
    func goToZero(){
        pageIndex = 0
    }
}


    
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
