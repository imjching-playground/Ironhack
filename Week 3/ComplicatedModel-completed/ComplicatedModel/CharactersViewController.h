//
//  CharactersViewController.h
//  ComplicatedModel
//
//  Created by Georgios Pessios on 5/14/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowModel.h"
#import "FormViewController.h"

@interface CharactersViewController : UIViewController
    <FormViewControllerDelegate>

@property(nonatomic, strong)ShowModel *show;
@property (weak, nonatomic) IBOutlet
    UITableView* tableView;

@end
