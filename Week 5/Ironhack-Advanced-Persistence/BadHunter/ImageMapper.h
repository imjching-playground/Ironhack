//
//  ImageMapper.h
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface ImageMapper : NSObject

- (void) storeImage:(UIImage *)image withUUID:(NSString *)uuid;
- (void) deleteImageWithUUID:(NSString *)uuid;
- (UIImage *) retrieveImageWithUUID:(NSString *)uuid;

@end
