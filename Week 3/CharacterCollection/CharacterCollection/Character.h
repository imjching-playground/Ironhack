//
//  Character.h
//  CharacterCollection
//
//  Created by Carlos Butron on 20/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *photo;


- (instancetype)initWithName:(NSString *)characterName photo:(NSString *)characterPhoto;


+ (NSArray *)theArrayOfCharactersFromDicts:(NSArray *)originalArray;


@end
