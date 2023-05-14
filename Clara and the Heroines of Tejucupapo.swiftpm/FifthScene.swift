//
//  FifthScene.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 10/04/23.
//

import SwiftUI
import SpriteKit
class FifthScene: SceneModel {
    weak var gameManager: GameManager?
    
    var dragging: SKSpriteNode!
    var cards = [SKSpriteNode]()
    var clara: SKSpriteNode!
    var items = [SKSpriteNode]()
    var itemsInBowl = [SKSpriteNode]()
    var distance: Double! = 0.2
    var originalPosition: CGPoint!
    override func didMove(to view: SKView) {
        let ground = SKNode()

        let groundBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width * 1.4, height: frame.height*0.1))

        ground.position = CGPoint(x: (frame.width * 0.5), y: frame.height * 0.2)

        ground.setScale(2)

        groundBody.isDynamic = false
        ground.name = "ground"

        ground.physicsBody = groundBody

        self.addChild(ground)
        
        physicsWorld.contactDelegate = self;
        
        setupLayer("FifthScene", 1)
        setupObjects()
        setupCards()
        setupContinueButton("continueButton1")
        addCardsOnScreen(1)
    }
    
    func setupFireAnimation(){
        var bowlTexture = [SKTexture]()
        
        bowlTexture.append(SKTexture(imageNamed: "Bowl5"))
        bowlTexture.append(SKTexture(imageNamed: "Bowl6"))
        bowlTexture.append(SKTexture(imageNamed: "Bowl7"))
        
        let fireMove = SKAction.animate(with: bowlTexture, timePerFrame: 0.5, resize: true, restore: true)
        
        let timer = SKAction.moveTo(x: bowl.position.x, duration: 3)
        
        fireAnimation = SKAction.repeatForever(fireMove)
        bowl.run(fireAnimation)
        
        bowl.run(timer, completion: {() -> Void in
            self.gameManager?.goToScene(.scene8)
        })
    }
    
    func setupObjects(){
        clara = SKSpriteNode(imageNamed: "Clara")
        clara.position = CGPoint(x: (frame.width * 0.1), y: frame.height * 0.4 + 0.1)
        clara.zPosition = 1
        clara.name = "Clara"
        clara.physicsBody?.allowsRotation = false
        clara.physicsBody?.affectedByGravity = false
        clara.physicsBody?.allowsRotation = false
        self.addChild(clara)
        
        bowl = SKSpriteNode(imageNamed: "Bowl1")
        bowl.position = CGPoint(x: (frame.width * 0.5), y: frame.height * 0.4)
        bowl.zPosition = 1
        let bowlBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width * 0.1, height: frame.height * 0.4))
        bowl.physicsBody = bowlBody
        bowl.physicsBody?.isDynamic = false
        bowl.physicsBody?.affectedByGravity = false
        bowl.name = "Bowl"
        bowl.physicsBody?.allowsRotation = false
        self.addChild(bowl)
    }
    
    func setupItems(){
        let indexes = Array(1...4)

        for i in indexes.reversed() {
            let name = "item\(i)"
            let item = SKSpriteNode(imageNamed: name)
            item.name = name
            items.append(item)

            item.position = CGPoint(x: (frame.width*0.85), y: (frame.height*distance))
            //item.size = CGSize(width: frame.width*0.125, height: frame.height*0.124)
            distance = distance + 0.2

            item.zPosition = 1
            
            let itemBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width*0.1, height: frame.height*0.2))
            
            item.physicsBody = itemBody
            item.physicsBody?.isDynamic = false
            item.physicsBody?.affectedByGravity = false
            item.physicsBody!.contactTestBitMask = bowl.physicsBody!.categoryBitMask
            self.addChild(item)
        }
    }

    func setupCards(){
        let indexes = Array(1...5)
        
        for i in indexes {
            let name = "FifthSceneCard\(i)"
            let card = SKSpriteNode(imageNamed: name)
            card.zPosition = 2
            card.name = name
            card.position = CGPoint(x: frame.width*0.55, y: frame.height*0.66)
            card.size = CGSize(width: frame.width*0.315, height: frame.height*0.1445)
            cards.append(card)
        }

    }
    func addCardsOnScreen(_ i: Int!){
        for card in cards {
            if card.name == "FifthSceneCard\(String(i))" {
                self.addChild(card)
            }
        }
    }
    func removeCardsFromScreen(_ i: Int!){
        for card in cards {
            if card.name == "FifthSceneCard\(String(i))" {
                card.removeFromParent()
            }
        }
    }

    func touchDown(atPoint pos : CGPoint) {

        for item in items {
            if item.contains(pos) {
                dragging = item
                originalPosition = item.position
                return
            }
        }
    }

    func touchMoved(toPoint pos : CGPoint) {
        if dragging != nil {
            dragging.position = pos
        }
    }
    
    func removeItemFromScreen(_ name: String!){
        for item in items {
            if item.name == name {
                item.removeFromParent()
            }
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if dragging != nil {
            if bowl.contains(pos){

                if itemsInBowl.count == 0 && dragging.name == "item3" {
                    let bowlTexture = SKTexture(imageNamed: "Bowl2")
                    bowl.texture = bowlTexture
                    removeItemFromScreen(dragging.name)
                    itemsInBowl.append(dragging)
                    removeCardsFromScreen(2)
                    addCardsOnScreen(3)
                }
                else if itemsInBowl.count == 1 && dragging.name == "item2" {
                    let bowlTexture = SKTexture(imageNamed: "Bowl3")
                    bowl.texture = bowlTexture
                    removeItemFromScreen(dragging.name)
                    itemsInBowl.append(dragging)
                    removeCardsFromScreen(3)
                    addCardsOnScreen(4)
                }
                else if itemsInBowl.count == 2 && dragging.name == "item4" {
                    let bowlTexture = SKTexture(imageNamed: "Bowl4")
                    bowl.texture = bowlTexture
                    removeItemFromScreen(dragging.name)
                    itemsInBowl.append(dragging)
                    removeCardsFromScreen(4)
                    addCardsOnScreen(5)
                }
                else if itemsInBowl.count == 3 && dragging.name == "item1" {
                    let bowlTexture = SKTexture(imageNamed: "Bowl5")
                    bowl.texture = bowlTexture
                    removeItemFromScreen(dragging.name)
                    itemsInBowl.append(dragging)
                    removeCardsFromScreen(5)
                    setupFireAnimation()
                }
            }
            for item in items {
                if item.name == dragging.name && originalPosition != nil{
                    dragging.position = originalPosition
                    originalPosition = nil
                }
            }
            dragging = nil
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "continueButton1"
            {
                removeCardsFromScreen(1)
                addCardsOnScreen(2)
                continueButton.removeFromParent()
                setupItems()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
