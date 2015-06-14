//
//  SoundHelper.h
//  cameraCafé
//
//  Created by Leo Font on 11/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SoundHelper;
@protocol SoundEffectDelegate <NSObject>
@optional

-(void)soundEffectDidFinishPlaying:(SoundHelper *)soundHelper;

@end

@interface SoundHelper : NSObject

@property (nonatomic, weak) id<SoundEffectDelegate> delegate;

-(void)play:(NSString *)soundFileName;
-(void)stop;

@end
