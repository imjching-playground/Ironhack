//
//  ImageService.h
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface ImageService : NSObject

- (void)imageWithURL:(NSURL *)imageURL completion:(void (^)(UIImage *imageName))completion;

@end
