import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State private var font: Font?
    // classe para exibicao de cenários
    var scene: SKScene {
        let scene = StartScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        return scene
    }
    
    var body: some View {
        // uma visualizacao swiftui que renderiza uma cena do spritekit
        SpriteView(scene: scene)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), contentMode: .fill)
            .ignoresSafeArea()
        
            .task {
                font = getFont(size: 20)
            }
    }
    func getFont(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url( forResource: "PixelOperator8", withExtension:
                                        "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL,CTFontManagerScope.process,nil)
        let font = Font.custom("PixelOperator8", size: size)
        return font
    }

}
//, debugOptions: [.showsPhysics]
