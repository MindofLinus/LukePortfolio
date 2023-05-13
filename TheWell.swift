//
//  TheWell.swift
//  DistantShores
//
//  

import Foundation
import SpriteKit

class TheWell : SKScene {
    var player = SKSpriteNode()
    var Dkmusic = SKAudioNode(fileNamed: "DKStart.mp3")


        func it() {
         player = self.childNode(withName: "player") as! SKSpriteNode
            if player.position.x > -200 && player.position.y > 80{
                   NSLog("Fell off first gap")
                   player.position.y = 79
                addChild(Dkmusic)
                   } else if player.position.y == 79 {
                       player.position.y = 65
                Dkmusic.run(SKAction.sequence([ SKAction.wait(forDuration: 4), SKAction.removeFromParent()]))

            } else if player.position.y == 65 && player.position.x > -80 {
                player.position.y = 0
            } else if player.position.y == 0 && player.position.x < -80 {
                player.position.y = -28
            } else if player.position.y == -28 && player.position.x < -280 {
                player.position.y = -80
            } else if player.position.y == -80 && player.position.x > -80 {
                player.position.y = -128
            } else if player.position.y == -128 && player.position.x > -320 {
                NSLog("Go to next scene inside well")
                                   let hotAir = AirBaloon(fileNamed: "AirBaloon")
                                   hotAir?.scaleMode = .aspectFill
                                   self.view?.presentScene(hotAir!, transition: SKTransition.fade(withDuration: 0.8))

            }}
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.79))
            let touchedNode = self.nodes(at: location)
            for node in touchedNode {
                if node.name == "temple" {
                    
                }
                else if node.name == "thewell" {
                    
                    
                }
                else if node.name == "lighttunnel" {
                   
                }
            }
            
            }
            
        }
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                    let location = touch.location(in: self)
                    player.run(SKAction.moveTo(x: location.x, duration: 0.79))
                
                }
            }
         override func update(_ currentTime: TimeInterval) {
            it()
            
        }
        
    }


