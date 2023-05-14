//
//  SecondScene.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 08/04/23.
//

import SwiftUI
import SpriteKit
class SecondScene: SceneModel {
    weak var gameManager: GameManager?
    
    var clara: SKSpriteNode!
    var felipe: SKSpriteNode!
    var walkRightAnimation: SKAction!
    var walkLeftAnimation: SKAction!
    var card1: SKSpriteNode!
    var card2: SKSpriteNode!
    override func didMove(to view: SKView) {
        let ground = SKNode()

        let groundBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*2, height: frame.height*0.1))

        ground.position = CGPoint(x: (frame.width*0.5), y: frame.height/5)

        ground.setScale(2)

        groundBody.isDynamic = false
        ground.name = "ground"

        ground.physicsBody = groundBody
        ground.physicsBody?.allowsRotation = false
        self.addChild(ground)
        
        physicsWorld.contactDelegate = self;
        
        setupLayer("SecondScene", 1)
        
        setupCards()
        self.addChild(card1)
        
        setupCharacters()
        setupAnimation()
    }
    
    func setupAnimation(){
        setupClaraWalkingAnimation()
        setupClaraMoveAnimation()
        setupFelipeWalkingAnimation()
        setupFelipeMoveAnimation()
    }
    
    func setupCharacters(){
        clara = SKSpriteNode(imageNamed: "Clara")
        clara.position = CGPoint(x: -(frame.width*0.1), y: frame.height/5 + 0.1)
        clara.zPosition = 1
        clara.name = "Clara"
        
        felipe = SKSpriteNode(imageNamed: "Felipe")
        felipe.position = CGPoint(x: (frame.width*1.2), y: frame.height/5 + 0.1)
        felipe.zPosition = 1
        felipe.name = "Felipe"
        
        let claraBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
        clara.physicsBody = claraBody
        clara.physicsBody?.allowsRotation = false
        clara.physicsBody?.affectedByGravity = false
        self.addChild(clara)
        
        let felipeBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
        felipe.physicsBody = felipeBody
        felipe.physicsBody?.allowsRotation = false
        felipe.physicsBody?.affectedByGravity = false
        self.addChild(felipe)
    }
    
    func setupClaraMoveAnimation(){
        let claraMove = SKAction.moveTo(x: (frame.width*0.40), duration: 7)
        
        clara.run(walkRightAnimation, withKey: "ClaraWalking")
        
        clara.run(claraMove, completion: {() -> Void in
            self.clara.removeAction(forKey: "ClaraWalking")
            self.setupContinueButton("continueButton1")
        })
    }
    func setupFelipeMoveAnimation(){
        let felipeMove = SKAction.moveTo(x: (frame.width*0.6), duration: 7)
        
        felipe.run(walkLeftAnimation, withKey: "FelipeWalking")
        
        felipe.run(felipeMove, completion: {() -> Void in
            self.felipe.removeAction(forKey: "FelipeWalking")
        })
    }
    
    func setupClaraWalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "ClaraWalking1"))
        walkListR.append(SKTexture(imageNamed: "Clara"))
        walkListR.append(SKTexture(imageNamed: "ClaraWalking2"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation = SKAction.repeat(walkR, count: 14)
    }
    
    func setupFelipeWalkingAnimation() {
        var walkListL = [SKTexture]()
        
        walkListL.append(SKTexture(imageNamed: "FelipeWalking1"))
        walkListL.append(SKTexture(imageNamed: "Felipe"))
        walkListL.append(SKTexture(imageNamed: "FelipeWalking2"))
        
        let walkL = SKAction.animate(with: walkListL,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkLeftAnimation = SKAction.repeat(walkL, count: 14)
    }
    func setupCards(){
        card1 = SKSpriteNode(imageNamed: "SecondSceneCard1")
        card1.zPosition = 2
        card1.name = "SecondSceneCard1"
        card1.position = CGPoint(x: frame.width*0.66, y: frame.height*0.75)
        card1.size = CGSize(width: frame.width*0.44, height: frame.height*0.179)
        
        
        card2 = SKSpriteNode(imageNamed: "SecondSceneCard2")
        card2.zPosition = 2
        card2.name = "SecondSceneCard2"
        card2.position = CGPoint(x: frame.width*0.66, y: frame.height*0.75)
        card2.size = CGSize(width: frame.width*0.44, height: frame.height*0.179)
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
                gameManager?.goToScene(.scene4)
            }
        }

    }
}
