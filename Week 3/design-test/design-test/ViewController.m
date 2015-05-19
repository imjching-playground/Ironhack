//
//  ViewController.m
//  design-test
//
//  Created by Carlos Butron on 19/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *names;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.names = @[@"Homer",@"Bart",@"Lisa"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    return indexPath;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    MyCell *myCell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    
    
    myCell.labelCell.text = self.names[indexPath.row];
    
    UIImage *photo = [UIImage imageNamed:@"kira"];
    
    [myCell.imageCell setImage:photo];

    
    return myCell;
    
}







@end
