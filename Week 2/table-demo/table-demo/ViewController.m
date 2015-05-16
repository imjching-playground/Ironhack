//
//  ViewController.m
//  table-demo
//
//  Created by Carlos Butron on 13/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *selfStudents;
@property (nonatomic, strong) NSArray *teachers;
@property (strong, nonatomic) NSArray *theFinalArrayToStoryboard;


@end

@implementation ViewController


- (void)setTheArray{
    

    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.theFinalArrayToStoryboard = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"people" ofType:@"plist"]];
    
    self.selfStudents = @[@"Carlos", @"George", @"Marcos"];
    
    self.teachers = @[@"Marin Todorov", @"Xavier Silva"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection: %lu", section);
    
    if (section == 0) {
        
        return self.selfStudents.count;
        
    } else if (section ==1) {
        
        return self.teachers.count;
        
    } else {
        
        return self.theFinalArrayToStoryboard.count;
        
    }
    
    
    
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 50;
    }
    if (indexPath.section == 2) {
       return 200;
    } else {
    
    
    
    return 100;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell for path: %lu, %lu", indexPath.section, indexPath.row);
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"StudentCell"];
    UITableViewCell *simpsons =[tableView dequeueReusableCellWithIdentifier:@"simpsonsCell"];
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.", (long)indexPath.row+1];
    
    if (indexPath.section == 0) {
    cell.detailTextLabel.text = self.selfStudents[indexPath.row];
        
        return cell;
    }
    else if (indexPath.section == 1)  {
    cell.detailTextLabel.text = self.teachers[indexPath.row];
        
        return cell;
    } else {
        
    NSDictionary *eachDictionary = self.theFinalArrayToStoryboard[indexPath.row];
        
        NSLog(@"%@", eachDictionary[@"imageName"]);
        
        UIImage *photo = [UIImage imageNamed:eachDictionary[@"imageName"]];
        [simpsons.imageView setImage:photo];
        
        simpsons.textLabel.text = eachDictionary[@"name"];

        return simpsons;
    }
    
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section ==0) {
        return @"STUDENTS";
    } else if (section==1){
        return @"TEACHERS";
    } else {
        return @"THE SIMPSONS";
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    if (section ==0) {
        return @"These are all the students in the class";
    } else if (section ==1) {
        return @"Those teachers are pretty awesome";
    } else {
        return @"The Simpsons people";
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *eachDictionary = self.theFinalArrayToStoryboard[indexPath.row];
    NSString * imageName = eachDictionary[@"imageName"];
    
    UIImage *characterPhoto = [UIImage imageNamed:imageName];
    
    PhotoViewController * photoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoController"];
    
    [self.navigationController pushViewController:photoVC animated:YES];
                                        
    photoVC.photo = characterPhoto;
    
    
}



@end
