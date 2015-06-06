//
//  DetailViewController.h
//  BadHunter
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AgentEditViewControllerDelegate.h"

@class Agent;

@interface AgentEditViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) Agent *agent;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) id<AgentEditViewControllerDelegate> delegate;

@end

