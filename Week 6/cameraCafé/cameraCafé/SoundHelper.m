//
//  SoundHelper.m
//  cameraCafé
//
//  Created by Leo Font on 11/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "SoundHelper.h"

@import AVFoundation;

@interface SoundHelper()<AVAudioPlayerDelegate>
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation SoundHelper


-(void)play:(NSString *)soundFileName {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:soundFileName ofType:@"wav"];
    
    NSError *err = nil;

    NSData *soundData = [[NSData alloc] initWithContentsOfFile:filePath options:NSDataReadingMapped error:&err];
    
    self.player = [[AVAudioPlayer alloc] initWithData:soundData
                                                error:&err];
    
     self.player.numberOfLoops = 0;
     self.player.delegate = self;
     [self.player play];
}


-(void)stop {
    
    [self.player stop];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    if ([self.delegate respondsToSelector:@selector(soundEffectDidFinishPlaying:)]) {
    
        [self.delegate soundEffectDidFinishPlaying:self];
    }
    
    
    
}






@end
