//
//  FormViewController.h
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@class FormViewController;

@protocol FormViewControllerDelegate <NSObject>


@required

//-(void)didCreateCharacter:(Character *)model;


//to know who form call delegate
-(void)formViewcontroller:(FormViewController *)formVC didcreateCharacter:(Character *)model;

@end


@interface FormViewController : UIViewController

@property (weak, nonatomic) id<FormViewControllerDelegate> delegate;

@end
