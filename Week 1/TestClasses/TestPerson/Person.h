//
//  Person.h
//  TestPerson
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ChangeNameDelegate.h"


@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, weak) NSString *surname;
@property (nonatomic, weak) NSString * ID;
@property (nonatomic, weak) id<ChangeNameDelegate> delegate;
@property (nonatomic, weak, readonly) UIImage *image;

- (void)printDescription;

- (instancetype)initWithName:(NSString *)myName;

- (instancetype)initWithName:(NSString *)myName
                     surname:(NSString *)mySurname
                          ID:(NSString *)myID;


@end
