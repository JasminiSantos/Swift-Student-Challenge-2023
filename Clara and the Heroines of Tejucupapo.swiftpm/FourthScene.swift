//
//  FourthScene.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 09/04/23.
//

import SwiftUI
import SpriteKit
class FourthScene: SceneModel {
    weak var gameManager: GameManager?
    
    var card: SKSpriteNode!
    override func didMove(to view: SKView) {
        
        setupLayer("FourthScene", 1)
        setupCards()
        setupContinueButton("continueButton")
        
    }
    func setupCards(){
        card = SKSpriteNode(imageNamed: "FourthSceneCard")
        card.zPosition = 2
        card.name = "FourthSceneCard"
        card.position = CGPoint(x: frame.width*0.66, y: frame.height*0.66)
        card.size = CGSize(width: frame.width*0.44, height: frame.height*0.179)
        self.addChild(card)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "continueButton"
            {
                gameManager?.goToScene(.scene7)
            }
        }
    }
}
