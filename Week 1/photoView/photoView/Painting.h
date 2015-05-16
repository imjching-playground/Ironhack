//
//  Painting.h
//  Storyboard101
//
//  Created by Carlos Butron on 06/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Painting : NSObject

@property (nonatomic, strong) NSString *photoName;
@property (nonatomic, strong) NSString *photoTitle;
@property (nonatomic, strong) NSNumber *genius;


- (instancetype)initWithPhotoName:(NSString *)myPhotoName
                       photoTitle:(NSString *)myPhotoTitle
                           genius:(NSNumber *)myGenius;

- (NSArray *)theArrayOfPhotosFromDicts:(NSArray *)originalArray;


@end
