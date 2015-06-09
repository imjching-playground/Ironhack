//
//  imageDownloader.h
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface imageDownloader : NSObject

+ (void)imageWithURL:(NSString *)url completionBlock:(void (^)(UIImage *image))completionBlock;

@end
