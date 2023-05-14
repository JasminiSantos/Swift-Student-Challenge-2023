//
//  MainMenu.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 07/04/23.
//

import SwiftUI
import SpriteKit
class MainMenu: SKScene, SKPhysicsContactDelegate {
    weak var gameManager: GameManager?
    
    var startButton: SKSpriteNode!
    override func didMove(to view: SKView) {
        setupLayer("MainMenu", 1)
        
        startButton = SKSpriteNode(imageNamed: "Start")
        startButton.position = CGPoint(x: frame.width*0.5, y: frame.height*0.1)
        startButton.size = CGSize(width: frame.width*0.157, height: frame.height*0.08)
        startButton.zPosition = 1
        startButton.name = "startButton"
        
        let startButtonBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.157, height: frame.height*0.08))
        startButtonBody.isDynamic = false
        
        startButton.physicsBody = startButtonBody
        self.addChild(startButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        if let name = touchedNode.name
        {
            if name == "startButton"
            {
                gameManager?.goToScene(.scene2)
            }
        }

    }
    
    func setupLayer(_ imageName: String!, _ layer: Int!) {
        let sprite1 = SKSpriteNode(imageNamed: imageName)
        sprite1.size.height = self.size.height
        
        let layerNode = SKNode()
        layerNode.addChild(sprite1)
        
        layerNode.zPosition = CGFloat(layer)
        layerNode.position = CGPoint(x: frame.width*0.5, y: frame.height*0.5)
        self.addChild(layerNode)
    }

}
