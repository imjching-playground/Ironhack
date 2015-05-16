//
//  CharacterViewController.h
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorldOf.h"
#import "FormViewController.h"

@interface CharacterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, FormViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (nonatomic, strong) WorldOf *worldOfObject;

@end
