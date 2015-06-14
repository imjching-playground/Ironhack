//
//  GameScene.m
//  testSK
//
//  Created by Leo Font on 13/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "GameScene.h"
#import "FinalScene.h"


@interface GameScene()<SKPhysicsContactDelegate>

@property (nonatomic,strong) SKAction* backgroundMusic;
@property (nonatomic,strong) SKAction* explossionFX;

@property (nonatomic) float distance;

@end

@implementation GameScene

static const uint32_t smallFishCategory     =  0x1 << 0;
static const uint32_t bigFishCategory        =  0x1 << 1;


-(void)didMoveToView:(SKView *)view {
    
    self.physicsWorld.contactDelegate = self;

    
    // Initialize music & FX (preload)
    
    self.backgroundMusic = [SKAction playSoundFileNamed:@"bg_music.wav" waitForCompletion:YES];
    
    self.explossionFX = [SKAction playSoundFileNamed:@"explosion.mp3"
                                   waitForCompletion:YES];
    
    self.distance = 200.0;
    
    [self playMusic];
    
    [self swimFish];
    
    [self atlasFishSwim];
    
    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 65;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
//    
    
//    SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"grad3.png"];
//    background.position =  CGPointMake(CGRectGetMidX(self.frame),
//                                       CGRectGetMidY(self.frame));
//    
//    background.zPosition = 0;
//    [self addChild:background];
    
    
   
    
    
}

#pragma Music & FX

-(void)playMusic {
    
    SKAction* repeatMusic = [SKAction repeatActionForever:self.backgroundMusic];
    
    [self runAction:repeatMusic withKey:@"music" ];

    
    
}

#pragma Fish methods

-(void)swimFish {
    
    SKSpriteNode* fish = (SKSpriteNode*)[self childNodeWithName:@"//fish2"];
    fish.scale = 2.0;
    
    fish.physicsBody.categoryBitMask = smallFishCategory;
    fish.physicsBody.contactTestBitMask = bigFishCategory;
 
    
//    SKAction* moveFish = [SKAction moveTo:CGPointMake(self.frame.size.width+400, fish.position.y) duration:5.0];
    
    SKAction* moveFish = [SKAction moveBy:CGVectorMake(self.frame.size.width+400, 0) duration:5.0];
    
    
    SKAction* cleanUp = [SKAction runBlock:^{
        [fish removeAllActions];
       // [fish removeAllChildren]; Si hay subnodos
        [fish removeFromParent];
        
        
        [self removeActionForKey:@"music"];
    }];
    
    SKAction* moveFishSeq = [SKAction sequence:@[moveFish,cleanUp]];
    
    
    SKAction* shrink = [SKAction scaleTo:1.8 duration:1.0];
    SKAction* grow = [SKAction scaleTo:2.0 duration:1.0];
    
    SKAction* sizeSeq = [SKAction sequence:@[shrink,grow]];
    
    SKAction* repeatSize = [SKAction repeatActionForever:sizeSeq];
    
    SKAction* groupAction = [SKAction group:@[moveFishSeq,
                                              repeatSize]];
    
    
    [fish runAction:groupAction];
    
    
    
}


-(void)atlasFishSwim {
    
    NSMutableArray *spriteFrames = [[NSMutableArray alloc]init];
    SKTextureAtlas *spriteAtlas =[SKTextureAtlas atlasNamed:@"Pez.atlas"];
    
    for (int i=1; i <= 5; i++) {
    
        SKTexture *temp = [spriteAtlas textureNamed:[NSString stringWithFormat:@"pez%d.png",i]];
         [spriteFrames addObject:temp];
    
    }
    
    SKSpriteNode* luckyFish = [SKSpriteNode spriteNodeWithTexture:spriteFrames[0]];
    luckyFish.scale = 4.0;
    
    luckyFish.physicsBody = [SKPhysicsBody bodyWithTexture:spriteFrames[0] size:[luckyFish size]];
    
    luckyFish.physicsBody.categoryBitMask = bigFishCategory;
    luckyFish.physicsBody.contactTestBitMask = smallFishCategory;
    luckyFish.physicsBody.affectedByGravity = NO;
    luckyFish.physicsBody.dynamic = YES;
    

    SKSpriteNode* theOtherFish = (SKSpriteNode*)[self childNodeWithName:@"fish2"];
    
    luckyFish.position =  CGPointMake(theOtherFish.position.x,CGRectGetMidY(self.frame));
    luckyFish.name = @"LuckyFish";
    luckyFish.zPosition = 100;
    
    [self addChild:luckyFish];
    
    SKAction* animateFrames = [SKAction animateWithTextures:spriteFrames
                                               timePerFrame:0.1];
    
    [luckyFish runAction:[SKAction repeatActionForever:animateFrames]];
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    SKSpriteNode* luckyFish = (SKSpriteNode*)[self childNodeWithName:@"LuckyFish"];
    SKSpriteNode* fish = (SKSpriteNode*)[self childNodeWithName:@"fish2"];
    
    luckyFish.position = CGPointMake(fish.position.x-self.distance, luckyFish.position.y);
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   
    
    SKSpriteNode* fish = (SKSpriteNode*)[self childNodeWithName:@"fish2"];
    [fish.physicsBody applyImpulse:CGVectorMake(0, 10)];
    
    self.distance -= 20.0;
   
    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        NSString *explosion = [[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"sks"];
//        
//        SKEmitterNode *explo = [NSKeyedUnarchiver unarchiveObjectWithFile:explosion];
//        [explo setPosition:location];
//        explo.zPosition = 100;
//        [self addChild:explo];
    }
        
//        SKLightNode* light = (SKLightNode*) [self childNodeWithName:@"backLight1"];
//        
//        light.position = location;
        
//    }
    
//     SKTransition *myTransition = [SKTransition fadeWithColor:[SKColor redColor] duration:2.0];
//    
//    FinalScene* scene = [[FinalScene alloc] initWithSize: CGSizeMake(self.frame.size.width,self.frame.size.height)];
//    
//    [self.scene.view presentScene: scene transition:myTransition];
//    
    
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

#pragma mark Physics delegate

- (void)didBeginContact:(SKPhysicsContact *)contact
{
  
//        NSLog(@"Contact A %d",contact.bodyA.categoryBitMask);
//        NSLog(@"Contact B %d",contact.bodyB.categoryBitMask);
    
    if ((contact.bodyA.categoryBitMask == smallFishCategory)
        && (contact.bodyB.categoryBitMask == bigFishCategory))
    {
        
        // Kill the fish
        SKSpriteNode* smallFish = (SKSpriteNode*)[self childNodeWithName:@"//fish2"];
        smallFish.physicsBody.dynamic = NO;
        
        
        SKSpriteNode* bigFish = (SKSpriteNode*)[self childNodeWithName:@"//LuckyFish"];
        bigFish.physicsBody.dynamic = NO;
        
        //2 - Show explosion
        
        NSString *explosion = [[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"sks"];
        
        SKEmitterNode *explo = [NSKeyedUnarchiver unarchiveObjectWithFile:explosion];
        
        
        [explo setPosition:smallFish.position] ;
        
        //2.1 - Instance emitter over fish
        explo.zPosition = 100;
        explo.name = @"explosion";
        [self addChild:explo];

        
        //1 - Play explosion sound
        [self runAction:self.explossionFX  completion:^{
            // 2.3 Remove emitter when sound finishes

            SKAction* fade = [SKAction fadeAlphaTo:0 duration:1.0];
            
            [[self childNodeWithName:@"explosion"]runAction:fade completion:^{
                [[self childNodeWithName:@"explosion"]removeFromParent];
            }];
            
        }];
        
        
        // In a more complex scenario, we would create emitter at load time not at
        // delegate call
        
        // 2.2 - Remove fish
        [smallFish removeAllActions];
        [smallFish removeFromParent];
        [bigFish removeAllActions];
        [bigFish removeFromParent];

        // Better fade out sprites and then in a completion block remove them
        //3 - Cleanup

        
        
        
    
        
        
        
        
        
    }
    
    
    
    
}




@end
