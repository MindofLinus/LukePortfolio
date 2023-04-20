//  Created by Luke Pomeroy

import SpriteKit
import GameplayKit
import ObjectiveC
import Foundation
import AVFoundation
import UIKit

class GameScene: SKScene {
    var player = SKSpriteNode()
    var ground2 = SKSpriteNode()
    var firstperson = SKSpriteNode()
    var tree = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var cloud = SKSpriteNode()
    var location = CGPoint()
    var audioPlayer: AVAudioPlayer?
    var MusicPlaying = SKAudioNode(fileNamed:"yoshi.mp3")
    var WorldSong1 = SKAudioNode(fileNamed: "world1.mp3")
    var Men1Music = SKAudioNode(fileNamed: "menu1.mp3")
    var endmus = SKAudioNode(fileNamed: "theend.mp3")
    let transer = SKTransition.reveal(with: .down, duration: 1.0)
// August Added background music and figured out SKAudio Nodes. Sheesh!
    // Feb Found the files and were doing this for real now!
   // var MusicPlaying: SKAudioNode!
    func SOUNDER() {
   // its globally declared, so it should be able to be removed.
        addChild(MusicPlaying)
    }
    func WorldMusic() {
        addChild(WorldSong1)
    }
    func MenuMusic() {
        addChild(Men1Music)

    }
        //Making a varaible to track movement
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
     //   let translation = recognizer.translation(in: self.view)
     //   var currentLocation : CGPoint = CGPoint(x: location.x+translation.x, y: location.y+translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
    }
    var lionthoughts = [1: "What is the weather outside today?", 2: "Do you like my hair today?", 3: "Do you think I could be your best friend?", 4: "Don't tell anyone about me liking you!", 5: "I don't think you realize how happy I am that you came by..."]
    var isMoving = false
    //First Lion Initialization
        func LionProperties() {
   let lionMan = SKSpriteNode(imageNamed: "nothingnow")

    lionMan.position = CGPoint(x: 180, y: 80)
        lionMan.physicsBody? .categoryBitMask = 3
        lionMan.physicsBody? .collisionBitMask = 0
        lionMan.physicsBody? .isDynamic = false
        addChild(lionMan)
    
    //Animation of Lion
        let duration = Double.random(in: 0...4)
        let lookleft = SKAction.setTexture(SKTexture(imageNamed: "leftlion"))
        let lookright = SKAction.setTexture(SKTexture(imageNamed: "rightlion"))
        let wait = SKAction.wait(forDuration: duration)
        let sequence = SKAction.sequence([wait, lookleft, wait, lookright, wait])
        lionMan.run(.repeatForever(sequence))
        
    }
    var times : Timer?
           var times2 : Timer?
           var times3 : Timer?
    override func didMove(to view: SKView) {

        
        Starting()
        //repeating the tree and clouds to generate in a loop
        //When player touched, to move player to x position 500, then STOP Timer.scheduledTimer
        //On all of them. Then we can render a new view
       
        guard times == nil else { return }
        times = Timer.scheduledTimer(timeInterval: TimeInterval(0.7), target: self, selector: #selector (GameScene.standTree), userInfo: nil, repeats: true)
        guard times2 == nil else { return }
        times2 = Timer.scheduledTimer(timeInterval: TimeInterval(0.6), target: self, selector: #selector
            (GameScene.movedCloud), userInfo: nil, repeats: true)
        guard times3 == nil else { return }
        times3 = Timer.scheduledTimer(timeInterval: TimeInterval(1.3), target: self, selector: #selector
            (GameScene.movedhobbit), userInfo: nil, repeats: true)
 

        
        //Put a border around the screen that objects can't bounce out from.
        let borderbody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderbody.friction = 0
        self.physicsBody = borderbody

    }
 
  //Declares some initial nodes
    func Starting() {
        player = self.childNode(withName: "player") as! SKSpriteNode
           tree = self.childNode(withName: "tree") as! SKSpriteNode
           ground = self.childNode(withName: "ground") as! SKSpriteNode
           sky = self.childNode(withName: "sky") as! SKSpriteNode
    
    }
    @objc func standTree() { //objective C function that sets a spawned objects properties
               let stoodtree = SKSpriteNode(imageNamed: "tree")
               stoodtree.position.x = -100
               stoodtree.position.y = -74
               stoodtree.zPosition = 1
               stoodtree.name = "stoodTree"
               addChild(stoodtree)
           }
    @objc func movedCloud() {
        let moveCloud = SKSpriteNode(imageNamed: "cloud")
        moveCloud.position.x = -150
        moveCloud.position.y = 120
        moveCloud.zPosition = 1.1
        moveCloud.name = "movedCloud"
        addChild(moveCloud)
    }
    @objc func movedPerson() {
        let movePerson = SKSpriteNode(imageNamed: "player")
        movePerson.position.x = -50
        movePerson.position.y = 0
        movePerson.zPosition = 1
        movePerson.name = "movedPerson"
        addChild(movePerson)
    }
     @objc func movedhobbit() {
        let movehobbit = SKSpriteNode(imageNamed: "hobbit")
        movehobbit.position.x = -100
        movehobbit.position.y = -60
        movehobbit.zPosition = 1
        movehobbit.name = "moveHobbit"
        addChild(movehobbit)
    }
    @objc func Movingtree() {
        enumerateChildNodes(withName: "stoodTree") { (movetree, stop) in
            let mtree = movetree as! SKSpriteNode
            mtree.position.x += 25
        } }
        @objc func Movingcloud() {
               enumerateChildNodes(withName: "movedCloud") { (mdcloud, stop) in
                   let ccloud = mdcloud as! SKSpriteNode
                   ccloud.position.x += 33
               }
            
    }
    @objc func MovingHobbit() {
    enumerateChildNodes(withName: "moveHobbit") { (mvhob, stop) in
        let mvh = mvhob as! SKSpriteNode
        mvh.position.x += 5
    }
    }
    @objc func MovingRabbit() {
        enumerateChildNodes(withName: "moveRabbit") { (mvrab, stop) in
        let mvr = mvrab as! SKSpriteNode
        mvr.position.x += 2
        } }
    //Lets move the player
        func RabbitMove() {
            NSLog("Rabbit seen?")
            let rabbit = SKSpriteNode(imageNamed: "rabbit")
            rabbit.position.x = -30
            rabbit.position.y = -25
            rabbit.zPosition = 1
            rabbit.name = "rabbit"
            addChild(rabbit)
            rabbit.run(SKAction.sequence([ SKAction.wait(forDuration: 14), SKAction.removeFromParent()]))
            
    }


    func MovingPlayer() {
        let player = SKSpriteNode(imageNamed: "player")
        player.position.x = -20
        player.position.y = 0
        player.zPosition = 1.2
        player.name = "Theplayer"
        addChild(player)
    }
    func pausemenu() {
        let frontscreen = SKSpriteNode(imageNamed: "mainmenu")
        frontscreen.position = CGPoint(x: 103.8, y: -63)
        frontscreen.zPosition = 1.5
        addChild(frontscreen)
        //runs music
        SOUNDER()
        //music time

            frontscreen.run(SKAction.sequence([
                              SKAction.wait(forDuration: 3),
                                  SKAction.removeFromParent()
                              ])
                          )
  
        }
         //FINALLY WE GOT PLAYER MOVEMENT! IT LETS THE FINGER DRAG THE PLAYER AROUND THE SCREEN!
    //THANK YOU THOUGH TO A YTBER!
    // we have a sweet touchedNode function that detects if you touched an SKSPRITE NODE! YEAH!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.34))
            ground.run(SKAction.moveTo(x:location.x, duration: 0.80))
            let touchedNode = self.nodes(at: location)
            for node in touchedNode {
                if node.name == "rabbit" {
                    NSLog("rabbit has been clicked")
                   //Transitions to the next scene.
                    let sceneTwo = SceneTwo(fileNamed: "SceneTwo")
                    sceneTwo?.scaleMode = .aspectFill
                    self.view?.presentScene(sceneTwo!, transition: SKTransition.fade(withDuration: 0.5))
                   //
                } else if node.name == "mrbuns" {
                    NSLog("They have mrbuns")
                    addChild(endmus)
                } else if node.name == "baloon" {
                    NSLog("Balloon clicked. Lets activate a song. World Music Playing 80 seconds.")
                    WorldMusic()
                    
                } else if node.name == "sun" {
                    NSLog("Sun tapped")
                    //MenuMusic()
                    MusicPlaying.run(SKAction.removeFromParent())
                    WorldSong1.run(SKAction.removeFromParent())
                    endmus.run(SKAction.removeFromParent())
                    
                }
            }
            if location.x < -280 && location.y > 140 {
                NSLog("opening menu screen")
                pausemenu()
               
                
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
                let location = touch.location(in: self)
                player.run(SKAction.moveTo(x: location.x, duration: 0.34))
            ground.run(SKAction.moveTo(x:location.x, duration: 0.80))
            
            }
        }
        
    func lookforThings()
    {// This should stop everything when they get to the other side.
        //Call some things here you want to be ran to be seen!

        if player.position.x > -240 {
            let label0 = SKLabelNode()
            addChild(label0)
            label0.text = "Start searching the forest for your friends..."
            label0.position.x = -211
            label0.position.y = 68
            label0.zPosition = 0.94
            label0.fontSize = 16
            label0.fontColor = SKColor.orange
        label0.run(SKAction.sequence([
                    SKAction.wait(forDuration: 1),
                        SKAction.removeFromParent()
                    ])
                )
        }
        if player.position.x > 320 {
            times?.invalidate()
            times = nil
            times2?.invalidate()
            times2 = nil
            times3?.invalidate()
            times3 = nil
            //More commands!!
            if player.position.x > 0{
                
            NSLog("Player approached the tree from the right side")
                
                let label4 = SKLabelNode()
                addChild(label4)
                label4.text = "Beware of the Fox, he has many temptations!"
                label4.position.x = 186
                label4.position.y = 27
                label4.zPosition = 0.5
                label4.fontSize = 12
                label4.fontColor = SKColor.red
                label4.run(SKAction.sequence([
                    SKAction.wait(forDuration: 2),
                    SKAction.removeFromParent()
                ])
                )
                if player.position.x > 330 {
                    NSLog("Player moved again, time for scene update")
                    RabbitMove()
                    MovingRabbit()
                    let label5 = SKLabelNode()
                    label5.text = "Hey, Im Bobbin the bunny, Follow me, I know where gold is!"
                    label5.position.x = 11
                    label5.position.y = 92
                    label5.zPosition = 0.5
                    label5.fontSize = 12
                    label5.fontColor = SKColor.blue
                    addChild(label5)
                    label5.run(SKAction.sequence([
                        SKAction.wait(forDuration: 4.5),
                            SKAction.removeFromParent()
                        ])
                    )
              
                }
                            }
            
        }
    
        
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        Movingtree()
        Movingcloud()
    MovingHobbit()
        lookforThings()
       //LionProperties()
    }
}
