//
//  character.h
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageName;


- (instancetype) initWithName:(NSString *)characterName
                    imageName:(NSString *)characterImageName;

//save plist data
- (NSDictionary *)toDictionary;

//+ (NSArray *)

@end
