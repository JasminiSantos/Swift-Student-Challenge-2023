//
//  Functions.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 13/04/23.
//

import Foundation
import SpriteKit
class SceneModel: SKScene, SKPhysicsContactDelegate {
    var continueButton: SKSpriteNode!
    var fireAnimation: SKAction!
    var bowl: SKSpriteNode!
    func setupLayer(_ imageName: String!, _ layer: Int!) {
        let sprite1 = SKSpriteNode(imageNamed: imageName)
        
        sprite1.size = frame.size
        sprite1.scene?.scaleMode = .aspectFit
        
        let layerNode = SKNode()
        layerNode.addChild(sprite1)
        
        layerNode.zPosition = CGFloat(layer)
        layerNode.position = CGPoint(x: frame.width*0.5, y: frame.height*0.5)
        self.addChild(layerNode)
        
    }
    func setupContinueButton(_ buttonName: String!){
        continueButton = SKSpriteNode(imageNamed: "Continue")
        continueButton.size = CGSize(width: frame.width*0.157, height: frame.height*0.08)
        continueButton.position = CGPoint(x: frame.width*0.5, y: frame.height*0.1)
        continueButton.zPosition = 1
        continueButton.name = buttonName
        
        let startButtonBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.05))
        startButtonBody.isDynamic = false
        
        continueButton.physicsBody = startButtonBody
        self.addChild(continueButton)
    }
    
    func randomString(length: Int) -> String {

        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
}
