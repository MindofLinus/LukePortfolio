//
//  SceneTwo.swift
//  DistantShores
//
//  Created by Luke//  
//

import Foundation
import SpriteKit

class SceneTwo : SKScene {
    let rabbit0 = SKSpriteNode()
    var player = SKSpriteNode()
   
    var Drums = SKAudioNode(fileNamed: "templescene.m4a")
    func drummy() {
    addChild(Drums)
    }
    
    func it() {
     player = self.childNode(withName: "player") as! SKSpriteNode
       
    }
    let storm = SKSpriteNode()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
        let location = touch.location(in: self)
        player.run(SKAction.moveTo(x: location.x, duration: 0.34))
        let touchedNode = self.nodes(at: location)
        for node in touchedNode {
            if node.name == "temple" {
                NSLog("temple has been clicked")
                let label0 = SKLabelNode()
                addChild(label0)
                label0.text = "The ominous temple stares back. Do you enter the temple or climb down the well?"
                label0.position.x = 19.7
                label0.position.y = 14
                label0.zPosition = 0.95
                label0.fontSize = 12
                label0.fontColor = SKColor.blue
                label0.run(SKAction.sequence([
                    SKAction.wait(forDuration: 2),
                    SKAction.removeFromParent()
                ])
                )
            }
            else if node.name == "thewell" {
                NSLog("Well tapped")
                let label1 = SKLabelNode()
                addChild(label1)
                label1.text = "A dimly lit lantern broadcasts a beam from below the well. Jump down by clicking the arrow."
                label1.position.x = 14
                label1.position.y = 81
                label1.zPosition = 0.9
                label1.fontSize = 12
                label1.fontColor = SKColor.blue
                label1.run(SKAction.sequence([
                    SKAction.wait(forDuration: 2),
                    SKAction.removeFromParent()
                     ])
                )
                
            }
            else if node.name == "wellar" {
                NSLog("Go to next scene inside well")
                let theWell = TheWell(fileNamed: "TheWell")
                theWell?.scaleMode = .aspectFill
                self.view?.presentScene(theWell!, transition: SKTransition.fade(withDuration: 0.8))

            } else if node.name == "stair" {
                NSLog("inside temple scene")
                let theTemple = InsideTemple(fileNamed: "InsideTemple")
                theTemple?.scaleMode = .aspectFill
                self.view?.presentScene(theTemple!, transition: SKTransition.fade(withDuration: 0.8))

            }
        }
        
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
                let location = touch.location(in: self)
                player.run(SKAction.moveTo(x: location.x, duration: 0.34))
            
            }
        }
     override func update(_ currentTime: TimeInterval) {
        it()
        
        
    }
   
}


