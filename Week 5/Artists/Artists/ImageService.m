//
//  ImageService.m
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIImage.h>
#import "ImageService.h"

@implementation ImageService

- (void)imageWithURL:(NSURL *)imageURL completion:(void (^)(UIImage *imageName))completion{
    
    
    // 2
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:imageURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                       // 3
                                                       UIImage *downloadedImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:location]];
                                                       
                                                       dispatch_async(dispatch_get_main_queue(), ^{
                                                           
                                                           completion(downloadedImage);
                                                           
                                                       });
                                                       
                                                       
                                                   }];
    
    


    // 4
    [downloadPhotoTask resume];
    
}

@end
