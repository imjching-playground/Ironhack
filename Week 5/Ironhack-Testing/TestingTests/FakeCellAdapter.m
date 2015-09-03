//
//  FakeCellAdapter.m
//  Testing
//
//  Created by Joan Romano on 6/5/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "FakeCellAdapter.h"

@implementation FakeCellAdapter

- (UITableViewCell *)cellForTableView:(UITableView *)tableView item:(id )item atIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

- (void)registerClassOrNibForTableView:(UITableView *)tableView
{

}

@end
