//
//  FirstScene.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 07/04/23.
//

import SwiftUI
import SpriteKit
class FirstScene: SceneModel {
    weak var gameManager: GameManager?
    
    var card1: SKSpriteNode!
    var card2: SKSpriteNode!
    var birds: SKSpriteNode!
    var birdsLoop: SKAction!
    override func didMove(to view: SKView) {
        setupLayer("FirstScene", 1)
        
        setupCards()
        
        self.addChild(card1)
        
        birds = SKSpriteNode(imageNamed: "Birds")
        birds.position = CGPoint(x: frame.width*1.1, y: frame.height*0.7)
        birds.zPosition = 2
        self.addChild(birds)
        setupBirdsAnimation()
        birds.run(birdsLoop)
        setupContinueButton("continueButton1")
        
    }
    func setupBirdsAnimation(){
        let birdsMove = SKAction.moveTo(x: -(frame.width * 1.2), duration: 14)
        
        birdsLoop = SKAction.repeatForever(birdsMove)
        
        birds.position = CGPoint(x: frame.width*1.1, y: frame.height * 0.7)
        
    }
    func setupCards(){
        card1 = SKSpriteNode(imageNamed: "FirstSceneCard1")
        card1.size = CGSize(width: frame.width*0.44, height: frame.height*0.243)
        card1.name = "FirstSceneCard1"
        card1.position = CGPoint(x: frame.width*0.66, y: frame.height*0.75)
        card1.zPosition = 3
        
        card2 = SKSpriteNode(imageNamed: "FirstSceneCard2")
        card2.name = "FirstSceneCard2"
        card2.position = CGPoint(x: frame.width*0.66, y: frame.height*0.75)
        card2.size = CGSize(width: frame.width*0.44, height: frame.height*0.179)
        card2.zPosition = 3
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        if let name = touchedNode.name
        {
            if name == "continueButton1"
            {
                card1.removeFromParent()
                self.addChild(card2)
                setupContinueButton("continueButton2")
            }
            else {
                gameManager?.goToScene(.scene3)
            }
        }

    }
    
}
