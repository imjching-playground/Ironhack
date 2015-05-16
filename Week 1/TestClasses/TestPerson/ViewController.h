//
//  ViewController.h
//  TestPerson
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeNameDelegate.h"


@interface ViewController : UIViewController<ChangeNameDelegate>

-(void) didChangeName:(NSString *)newName;


@end

