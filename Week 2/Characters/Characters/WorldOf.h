//
//  WorldOf.h
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorldOf : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSArray *characters;

- (instancetype)initWithName:(NSString *)worldOfName
                   imageName:(NSString *)worldOfImageName
                   characters:(NSArray *)worldOfCharacters;

+ (NSArray *)setArrayWithWorldAndCharacters;

- (NSDictionary *)toDictionary;

@end
