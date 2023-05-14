
import SwiftUI
import SpriteKit
struct ContentView: View {
    @StateObject var gameManager = GameManager()
    
    var body: some View {
        
        VStack {
            switch gameManager.selectedScene {
                case .scene1:
                    SpriteView(scene: getScene1()).ignoresSafeArea().transition(.opacity)
                case .scene2:
                    SpriteView(scene: getScene2()).ignoresSafeArea().transition(.opacity)
                case .scene3:
                    SpriteView(scene: getScene3()).ignoresSafeArea().transition(.opacity)
                case .scene4:
                    SpriteView(scene: getScene4()).ignoresSafeArea().transition(.opacity)
                case .scene5:
                    SpriteView(scene: getScene5()).ignoresSafeArea().transition(.opacity)
                case .scene6:
                    SpriteView(scene: getScene6()).ignoresSafeArea().transition(.opacity)
                case .scene7:
                    SpriteView(scene: getScene7()).ignoresSafeArea().transition(.opacity)
                case .scene8:
                    SpriteView(scene: getScene8()).ignoresSafeArea().transition(.opacity)
            }
        }
    }
    
    func getScene1() -> SKScene {
        gameManager.playSound()
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = MainMenu(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }

    func getScene2() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        let scene = FirstScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    func getScene3() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = SecondScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    func getScene4() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = ThirdScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    func getScene5() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = ThirdScenePart2(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    func getScene6() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = FourthScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    func getScene7() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = FifthScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    
    func getScene8() -> SKScene {
        var height = 1366
        var width = 1024
        
        if height > width {
            let aux = height
            height = width
            width = aux

        }
        
        let scene = SixthScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .aspectFit
        scene.gameManager = gameManager
        return scene
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
