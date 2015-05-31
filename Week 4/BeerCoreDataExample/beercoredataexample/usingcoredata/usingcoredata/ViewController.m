//
//  ViewController.m
//  UsingCoreData
//
//  Created by Georgios Pessios on 5/26/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataEntityManager.h"
#import "DogEntity.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)IBOutlet UITextField *addBreedTextField;
@property(nonatomic, strong)IBOutlet UITextField *searchBreedTextField;
@property(nonatomic, strong)IBOutlet UILabel *searchResultLabel;
@property(nonatomic, strong)DogEntity *dog;
@property(nonatomic, strong)CoreDataEntityManager *manager;
@property(nonatomic, strong)NSArray *allDogsArray;
@property(nonatomic, strong)IBOutlet UITableView *dogsTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [CoreDataEntityManager sharedEntityManager];
    self.allDogsArray = [self.manager allDogs];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actionSaveBreed:(id)sender{

    [self.manager createDogEntityWithBreed:self.addBreedTextField.text];
    self.allDogsArray = [self.manager allDogs];
    [self.dogsTableView reloadData];
    
}

-(IBAction)actionSearchBreed:(id)sender{
    
    DogEntity *foundDog = [self.manager dogWithBreed:self.searchBreedTextField.text];
    if(foundDog){
        self.searchResultLabel.textColor = [UIColor greenColor];
        self.searchResultLabel.text =[NSString stringWithFormat:@"FOUND: %@", foundDog.breed] ;
        [self.dogsTableView reloadData];
    }else{
        
        self.searchResultLabel.text = @"BREED NOT FOUND";
        self.searchResultLabel.textColor = [UIColor redColor];
        
        
    }
    
    


}

-(void)returnAllBreeds{

    NSArray *allDogs = [self.manager allDogs];
    
    for (DogEntity *eachDog in allDogs) {
        NSLog(@"%@", eachDog.breed);
    }


}

#pragma mark - UITableViewDataSource methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.allDogsArray count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DogCell"];
    cell.textLabel.text = [self.allDogsArray[indexPath.row] breed];
    
    return cell;

}

@end
