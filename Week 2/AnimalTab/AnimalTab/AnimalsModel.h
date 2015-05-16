//
//  Animal.h
//  OnlyAnimals
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimalsModel : NSObject

+ (instancetype)sharedModel;

@property (assign, nonatomic) int animalCount;

@end
