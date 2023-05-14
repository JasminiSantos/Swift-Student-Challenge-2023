//
//  ThirdScenePart2.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 12/04/23.
//

import SwiftUI
import SpriteKit
class ThirdScenePart2: SceneModel{
    weak var gameManager: GameManager?
    
    var enemy1: SKSpriteNode!
    var enemy2: SKSpriteNode!
    var enemy3: SKSpriteNode!
    var eyes: SKSpriteNode!
    var walkRightAnimation1: SKAction!
    var walkRightAnimation2: SKAction!
    var walkRightAnimation3: SKAction!
    var walkRightAnimation4: SKAction!
    var blinkingAnimation: SKAction!
    var card: SKSpriteNode!
    override func didMove(to view: SKView) {
        let ground = SKNode()

        let groundBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*1.4, height: frame.height/10))

        ground.position = CGPoint(x: (frame.width*0.5), y: frame.height/5)

        ground.setScale(2)

        groundBody.isDynamic = false
        ground.name = "ground"

        ground.physicsBody = groundBody
    
        self.addChild(ground)
        
        physicsWorld.contactDelegate = self;
        
        setupLayer("ThirdScenePart2", 1)
        setupCharactersInScene()
        //setupCards()
        setupTexturesAnimations()
        setupEyesAnimation()
        setupEnemy1MoveAnimation()
        setupEnemy2MoveAnimation()
        setupEnemy3MoveAnimation()
        self.setupContinueButton("continueButton")
        
    }
    
    func setupCharactersInScene(){
        eyes = SKSpriteNode(imageNamed: "eyes1")
        eyes.position = CGPoint(x: (frame.width*0.5), y: frame.height*0.6)
        eyes.zPosition = 1
        eyes.name = "eyes"
        
        enemy1 = SKSpriteNode(imageNamed: "enemy1Right1")
        enemy1.position = CGPoint(x: (frame.width*0.6), y: frame.height/5 + 0.1)
        enemy1.zPosition = 1
        enemy1.name = "Enemy1"
        enemy1.physicsBody?.affectedByGravity = false
        
        enemy2 = SKSpriteNode(imageNamed: "enemy2Right1")
        enemy2.position = CGPoint(x: (frame.width*0.40), y: frame.height/5 + 0.1)
        enemy2.zPosition = 1
        enemy2.name = "Enemy2"
        enemy2.physicsBody?.affectedByGravity = false
        
        enemy3 = SKSpriteNode(imageNamed: "enemy3Right1")
        enemy3.position = CGPoint(x: (frame.width*0.20), y: frame.height/5 + 0.1)
        enemy3.zPosition = 1
        enemy3.name = "Enemy3"
        enemy3.physicsBody?.affectedByGravity = false
        
        let eyesBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
        eyes.physicsBody = eyesBody
        eyes.physicsBody?.isDynamic = false
        self.addChild(eyes)
        
        
        let enemy1Body = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
        enemy1.physicsBody = enemy1Body
        self.addChild(enemy1)
        
        let enemy2Body = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
        enemy2.physicsBody = enemy2Body
        self.addChild(enemy2)
        
        let enemy3Body = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
        enemy3.physicsBody = enemy3Body
        self.addChild(enemy3)
    }
    
    func setupTexturesAnimations(){
        setupEnemy1WalkingAnimation()
        setupEnemy2WalkingAnimation()
        setupEnemy3WalkingAnimation()
    }
    func setupCards(){
        card = SKSpriteNode(imageNamed: "ThirdSceneCard")
        card.zPosition = 2
        card.name = "ThirdSceneCard"
        card.position = CGPoint(x: frame.width*0.66, y: frame.height*0.66)
        self.addChild(card)
    }
    
    func setupEyesAnimation() {
        var blinkingTexture = [SKTexture]()
        
        blinkingTexture.append(SKTexture(imageNamed: "eyes1"))
        blinkingTexture.append(SKTexture(imageNamed: "eyes2"))
        
        let blinking = SKAction.animate(with: blinkingTexture,
                                     timePerFrame: 1,
                                    resize: true,
                                    restore: true)
        
        blinkingAnimation = SKAction.repeatForever(blinking)
        eyes.run(blinkingAnimation)
    }
    
    func setupEnemy1MoveAnimation(){
        let enemy1Move = SKAction.moveTo(x: (frame.width*1.4), duration: 7)
        
        enemy1.run(walkRightAnimation1, withKey: "Enemy1Walking")
        

        enemy1.run(enemy1Move, completion: {() -> Void in
            self.enemy1.removeAction(forKey: "Enemy1Walking")
        })
    }
    
    func setupEnemy1WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "enemy1Right2"))
        walkListR.append(SKTexture(imageNamed: "enemy1Right1"))
        walkListR.append(SKTexture(imageNamed: "enemy1Right3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation1 = SKAction.repeat(walkR, count: 14)
    }
    func setupEnemy2MoveAnimation(){
        let enemy2Move = SKAction.moveTo(x: (frame.width*1.3), duration: 7)
        
        enemy2.run(walkRightAnimation2, withKey: "Enemy2Walking")
        

        enemy2.run(enemy2Move, completion: {() -> Void in
            self.enemy2.removeAction(forKey: "Enemy2Walking")
        })
    }
    
    func setupEnemy2WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "enemy2Right2"))
        walkListR.append(SKTexture(imageNamed: "enemy2Right1"))
        walkListR.append(SKTexture(imageNamed: "enemy2Right3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation2 = SKAction.repeat(walkR, count: 14)
    }
    
    func setupEnemy3MoveAnimation(){
        let enemy3Move = SKAction.moveTo(x: (frame.width*1.2), duration: 7)
        
        enemy3.run(walkRightAnimation3, withKey: "Enemy3Walking")
        

        enemy3.run(enemy3Move, completion: {() -> Void in
            self.enemy3.removeAction(forKey: "Enemy3Walking")
        })
    }
    
    func setupEnemy3WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "enemy3Right2"))
        walkListR.append(SKTexture(imageNamed: "enemy3Right1"))
        walkListR.append(SKTexture(imageNamed: "enemy3Right3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation3 = SKAction.repeat(walkR, count: 14)
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
                gameManager?.goToScene(.scene6)
            }
        }
    }

}

