//
//  SixthScene.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 11/04/23.
//

import SwiftUI
import SpriteKit
class SixthScene: SceneModel {
    weak var gameManager: GameManager?
    
    var card: SKSpriteNode!
    
    var enemy1: SKSpriteNode!
    var enemy2: SKSpriteNode!
    var enemy3: SKSpriteNode!
    
    var clara: SKSpriteNode!
    var girl1: SKSpriteNode!
    var girl2: SKSpriteNode!
    var girl3: SKSpriteNode!
    
    var walkLeftAnimation1: SKAction!
    var walkLeftAnimation2: SKAction!
    var walkLeftAnimation3: SKAction!
    
    var claraWalkRightAnimation: SKAction!
    var walkRightAnimation1: SKAction!
    var walkRightAnimation2: SKAction!
    var walkRightAnimation3: SKAction!
    
    var attackingEnabled = false
    var attackCount = 0
    var thrownItems = [SKSpriteNode]()
    var cardCount = 1;
    
    override func didMove(to view: SKView) {
        let ground = SKNode()

        let groundBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width * 2, height: frame.height*0.1))

        ground.position = CGPoint(x: (frame.width * 0.5), y: frame.height * 0)

        groundBody.isDynamic = false
        ground.name = "ground"

        ground.physicsBody = groundBody
    
        self.addChild(ground)
        
        physicsWorld.contactDelegate = self;
        
        setupLayer("SixthScene", 1)
        
        setupBowlOnScreen()
        setupCharactersInScene()
        
        enemiesArrivingAnimation()
        setupFireAnimation()
    }
    func setupCard(_ cardNumber: Int!){
        
        card = SKSpriteNode(imageNamed: "SixthSceneCard\(String(cardNumber))")
        card.name = "SixthSceneCard\(String(cardNumber))"
        card.position = CGPoint(x: frame.width*0.66, y: frame.height*0.75)
        card.size = CGSize(width: frame.width*0.43, height: frame.height*0.167)
        card.zPosition = 4
        self.addChild(card)
        cardCount += 1
    }
    
    func enemiesArrivingAnimation(){
        setupEnemy1WalkingAnimation()
        setupEnemy1MoveAnimation()
        setupEnemy2WalkingAnimation()
        setupEnemy2MoveAnimation()
        setupEnemy3WalkingAnimation()
        setupEnemy3MoveAnimation()
    }
    
    func enemiesLeavingAnimation(){
        setupEnemy1WalkingAnimation2()
        setupEnemy1MoveAnimation2()
        setupEnemy2WalkingAnimation2()
        setupEnemy2MoveAnimation2()
        setupEnemy3WalkingAnimation2()
        setupEnemy3MoveAnimation2()
    }
    
    func girlsArrivingAnimation(){
        self.addChild(clara)
        self.addChild(girl1)
        self.addChild(girl2)
        self.addChild(girl3)
        setupClaraWalkingAnimation()
        setupClaraMoveAnimation()
        setupGirl1WalkingAnimation()
        setupGirl1MoveAnimation()
        setupGirl2WalkingAnimation()
        setupGirl2MoveAnimation()
        setupGirl3WalkingAnimation()
        setupGirl3MoveAnimation()
    }
    
    func setupFireAnimation(){
        var bowlTexture = [SKTexture]()
        
        bowlTexture.append(SKTexture(imageNamed: "Bowl5"))
        bowlTexture.append(SKTexture(imageNamed: "Bowl6"))
        bowlTexture.append(SKTexture(imageNamed: "Bowl7"))
        
        let fireMove = SKAction.animate(with: bowlTexture, timePerFrame: 0.5, resize: true, restore: true)
        
        fireAnimation = SKAction.repeatForever(fireMove)
        bowl.run(fireAnimation)
    }
    
    func throwItem(position: CGPoint){
        
        if attackingEnabled {
            let i = Int.random(in: 1...8)
            
            let name = "random\(i)"
            let item = SKSpriteNode(imageNamed: name)
            item.name = randomString(length: 15)
            item.position = position
            item.position.x = 0
            item.zPosition = 2
            
            let itemBody = SKPhysicsBody(rectangleOf: item.size)
            item.physicsBody = itemBody
            item.physicsBody?.isDynamic = true
            self.addChild(item)
            item.physicsBody?.applyImpulse(CGVector(dx: CGFloat.random(in: frame.width*0.1 ... frame.width*0.4),
                                                    dy: CGFloat.random(in: frame.height*0.1 ... frame.height*0.2)))
            thrownItems.append(item)
            self.attackCount += 1
            if attackCount == 15 {
                self.card.removeFromParent()
                removeThrownItemsPhysics()
                attackingEnabled = false
                enemiesLeavingAnimation()
                girlsArrivingAnimation()
                setupCard(self.cardCount)
            }
        }
    }
    func removeThrownItemsPhysics(){
        for thrown in thrownItems {
            thrown.physicsBody?.isDynamic = false
            thrown.physicsBody?.affectedByGravity = true
            thrown.removeFromParent()
        }
    }
    func setupCharactersInScene(){
        enemy1 = SKSpriteNode(imageNamed: "enemy1Left1")
        enemy1.position = CGPoint(x: (frame.width*1.1), y: frame.height*0.3)
        enemy1.zPosition = 2
        enemy1.name = "Enemy1"
        
        let enemy1Body = SKPhysicsBody(rectangleOf: enemy1.size)
        enemy1.physicsBody = enemy1Body
        enemy1.physicsBody?.affectedByGravity = true
        enemy1.physicsBody?.isDynamic = true
        enemy1.physicsBody?.allowsRotation = false

        self.addChild(enemy1)
        
        enemy2 = SKSpriteNode(imageNamed: "enemy2Left1")
        enemy2.position = CGPoint(x: (frame.width*1.2), y: frame.height*0.3)
        enemy2.zPosition = 2
        enemy2.name = "Enemy2"
        
        let enemy2Body = SKPhysicsBody(rectangleOf: enemy2.size)
        enemy2.physicsBody = enemy2Body
        enemy2.physicsBody?.affectedByGravity = true
        enemy2.physicsBody?.isDynamic = true
        enemy2.physicsBody?.allowsRotation = false
        self.addChild(enemy2)
        
        
        enemy3 = SKSpriteNode(imageNamed: "enemy3Left1")
        enemy3.position = CGPoint(x: (frame.width*1.3), y: frame.height*0.3)
        enemy3.zPosition = 2
        enemy3.name = "Enemy3"
        
        let enemy3Body = SKPhysicsBody(rectangleOf: enemy3.size)
        enemy3.physicsBody = enemy3Body
        enemy3.physicsBody?.affectedByGravity = true
        enemy3.physicsBody?.isDynamic = true
        enemy3.physicsBody?.allowsRotation = false
        self.addChild(enemy3)
        
        clara = SKSpriteNode(imageNamed: "Clara")
        clara.position = CGPoint(x: -(frame.width*0.2), y: frame.height*0.3)
        clara.zPosition = 3
        clara.name = "girl1"
        
        let clara1Body = SKPhysicsBody(rectangleOf: clara.size)
        clara.physicsBody = clara1Body
        clara.physicsBody?.affectedByGravity = false
        clara.physicsBody?.isDynamic = false
        
        girl1 = SKSpriteNode(imageNamed: "SixthSceneGirl1Frame1")
        girl1.position = CGPoint(x: -(frame.width*0.3), y: frame.height*0.3)
        girl1.zPosition = 3
        girl1.name = "girl1"
        
        let girl1Body = SKPhysicsBody(rectangleOf: girl1.size)
        girl1.physicsBody = girl1Body
        girl1.physicsBody?.affectedByGravity = false
        girl1.physicsBody?.isDynamic = false

        
        girl2 = SKSpriteNode(imageNamed: "SixthSceneGirl2Frame1")
        girl2.position = CGPoint(x: -(frame.width*0.4), y: frame.height*0.3)
        girl2.zPosition = 3
        girl2.name = "girl2"
        
        let girl2Body = SKPhysicsBody(rectangleOf: girl2.size)
        girl2.physicsBody = girl2Body
        girl2.physicsBody?.affectedByGravity = false
        girl2.physicsBody?.isDynamic = false
        
        girl3 = SKSpriteNode(imageNamed: "SixthSceneGirl3Frame1")

        girl3.position = CGPoint(x: -(frame.width*0.5), y: frame.height*0.3)
        girl3.zPosition = 3
        girl3.name = "girl3"
        
        
        let girl3Body = SKPhysicsBody(rectangleOf: girl3.size)
        girl3.physicsBody = girl3Body
        girl3.physicsBody?.affectedByGravity = false
        girl3.physicsBody?.isDynamic = false
    }
    
    func setupBowlOnScreen(){
        bowl = SKSpriteNode(imageNamed: "Bowl1")
        bowl.position = CGPoint(x: (frame.width * 0.2), y: frame.height * 0.45)
        bowl.zPosition = 1
        bowl.physicsBody?.isDynamic = false
        bowl.physicsBody?.affectedByGravity = false
        bowl.name = "Bowl"
        self.addChild(bowl)
    }
    
    func setupEnemiesRedEyes(){
        let texture1 = SKTexture(imageNamed: "enemy1RedEyes")
        let texture2 = SKTexture(imageNamed: "enemy2RedEyes")
        let texture3 = SKTexture(imageNamed: "enemy3RedEyes")
        enemy1.texture = texture1
        enemy2.texture = texture2
        enemy3.texture = texture3
        attackingEnabled = true
    }
    
    func setupEnemy1MoveAnimation(){
        let enemy1Move = SKAction.moveTo(x: (frame.width * 0.35), duration: 5)
        
        enemy1.run(walkLeftAnimation1, withKey: "Enemy1Walking")
        

        enemy1.run(enemy1Move, completion: {() -> Void in
            self.enemy1.removeAction(forKey: "Enemy1Walking")
        })
    }
    
    func setupEnemy1WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "enemy1Left2"))
        walkListR.append(SKTexture(imageNamed: "enemy1Left1"))
        walkListR.append(SKTexture(imageNamed: "enemy1Left3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkLeftAnimation1 = SKAction.repeat(walkR, count: 14)
    }
    func setupEnemy2MoveAnimation(){
        let enemy2Move = SKAction.moveTo(x: (frame.width * 0.55), duration: 5)
        
        enemy2.run(walkLeftAnimation2, withKey: "Enemy2Walking")
        

        enemy2.run(enemy2Move, completion: {() -> Void in
            self.enemy2.removeAction(forKey: "Enemy2Walking")
        })
    }
    
    func setupEnemy2WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "enemy2Left2"))
        walkListR.append(SKTexture(imageNamed: "enemy2Left1"))
        walkListR.append(SKTexture(imageNamed: "enemy2Left3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkLeftAnimation2 = SKAction.repeat(walkR, count: 14)
    }
    
    func setupEnemy3MoveAnimation(){
        let enemy3Move = SKAction.moveTo(x: (frame.width * 0.75), duration: 5)
        
        enemy3.run(walkLeftAnimation3, withKey: "Enemy3Walking")
        

        enemy3.run(enemy3Move, completion: {() -> Void in
            self.enemy3.removeAction(forKey: "Enemy3Walking")
            self.setTimer(0.1)
        })
        
    }
    
    func setTimer(_ time: Double){
        let timer = SKAction.moveTo(x: bowl.position.x, duration: time)
        bowl.run(timer, completion: {() -> Void in
            self.setupEnemiesRedEyes()
            self.setupCard(self.cardCount)
        })
    }
    
    func setupEnemy3WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "enemy3Left2"))
        walkListR.append(SKTexture(imageNamed: "enemy3Left1"))
        walkListR.append(SKTexture(imageNamed: "enemy3Left3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkLeftAnimation3 = SKAction.repeat(walkR, count: 14)
        
    }
    
    func setupEnemy1MoveAnimation2(){
        let enemy1Move = SKAction.moveTo(x: (frame.width*1.2), duration: 5)
        
        enemy1.run(walkRightAnimation1, withKey: "Enemy1Walking")
        

        enemy1.run(enemy1Move, completion: {() -> Void in
            self.enemy1.removeAction(forKey: "Enemy1Walking")
        })
    }
    
    func setupEnemy1WalkingAnimation2() {
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
    func setupEnemy2MoveAnimation2(){
        let enemy2Move = SKAction.moveTo(x: (frame.width*1.3), duration: 5)
        
        enemy2.run(walkRightAnimation2, withKey: "Enemy2Walking")
        

        enemy2.run(enemy2Move, completion: {() -> Void in
            self.enemy2.removeAction(forKey: "Enemy2Walking")
        })
    }
    
    func setupEnemy2WalkingAnimation2() {
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
    
    func setupEnemy3MoveAnimation2(){
        let enemy3Move = SKAction.moveTo(x: (frame.width*1.4), duration: 5)
        
        enemy3.run(walkRightAnimation3, withKey: "Enemy3Walking")
        

        enemy3.run(enemy3Move, completion: {() -> Void in
            self.enemy3.removeAction(forKey: "Enemy3Walking")
            self.setupContinueButton("Continue")
            self.continueButton.zPosition = 4
        })
    }
    
    func setupEnemy3WalkingAnimation2() {
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
    
    func setupClaraMoveAnimation(){
        let claraMove = SKAction.moveTo(x: (frame.width*0.8), duration: 5)
        
        clara.run(claraWalkRightAnimation, withKey: "Girl1Walking")
        

        clara.run(claraMove, completion: {() -> Void in
            self.clara.removeAction(forKey: "Girl1Walking")
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
        
        claraWalkRightAnimation = SKAction.repeat(walkR, count: 14)
    }
    
    
    func setupGirl1MoveAnimation(){
        let girl1Move = SKAction.moveTo(x: (frame.width*0.6), duration: 5)
        
        girl1.run(walkRightAnimation1, withKey: "Girl1Walking")
        

        girl1.run(girl1Move, completion: {() -> Void in
            self.girl1.removeAction(forKey: "Girl1Walking")
        })
    }
    
    func setupGirl1WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl1Frame2"))
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl1Frame1"))
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl1Frame3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation1 = SKAction.repeat(walkR, count: 14)
    }
    func setupGirl2MoveAnimation(){
        let girl2Move = SKAction.moveTo(x: (frame.width*0.4), duration: 5)
        
        girl2.run(walkRightAnimation2, withKey: "Girl2Walking")
        

        girl2.run(girl2Move, completion: {() -> Void in
            self.girl2.removeAction(forKey: "Girl2Walking")
        })
    }
    
    func setupGirl2WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl2Frame2"))
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl2Frame1"))
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl2Frame3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation2 = SKAction.repeat(walkR, count: 14)
    }
    
    func setupGirl3MoveAnimation(){
        let enemy3Move = SKAction.moveTo(x: (frame.width*0.2), duration: 5)
        
        girl3.run(walkRightAnimation3, withKey: "Girl3Walking")
        

        girl3.run(enemy3Move, completion: {() -> Void in
            self.girl3.removeAction(forKey: "Girl3Walking")
        })
    }
    
    func setupGirl3WalkingAnimation() {
        var walkListR = [SKTexture]()
        
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl3Frame2"))
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl3Frame1"))
        walkListR.append(SKTexture(imageNamed: "SixthSceneGirl3Frame3"))
        
        let walkR = SKAction.animate(with: walkListR,
                                     timePerFrame: 0.5,
                                    resize: true,
                                    restore: true)
        
        walkRightAnimation3 = SKAction.repeat(walkR, count: 14)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        throwItem(position: pos)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        if let name = touchedNode.name
        {
            if name == "Continue"
            {
                if cardCount <= 3{
                    self.card.removeFromParent()
                    setupCard(cardCount)
                    setupContinueButton("Continue")
                    continueButton.zPosition = 4
                }
                else if cardCount == 4 {
                    self.card.removeFromParent()
                    setupCard(cardCount)
                    let texture = SKTexture(imageNamed: "TheEnd")
                    continueButton.name = "End"
                    continueButton.texture = texture
                    continueButton.zPosition = 4
                }
            }
            else if name == "End"{
                gameManager?.goToScene(.scene1)
            }
        }

    }
    

}

