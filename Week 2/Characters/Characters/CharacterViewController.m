//
//  CharacterViewController.m
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "CharacterViewController.h"
#import "Character.h"
#import "MyCell.h"
#import "DetailsViewController.h"
#import "FormViewController.h"

@interface CharacterViewController ()

@property (nonatomic, strong) NSArray *characterArray;
@property (nonatomic) NSInteger lastSelectedRow;

@end

@implementation CharacterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.characterArray = self.worldOfObject.characters;
    
    self.title = self.worldOfObject.name;
    

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection: %lu", section);
    
    
    return self.characterArray.count;
    
    
    
}

//size of cells

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (indexPath.section == 0) {
//        return 50;
//    }
//    if (indexPath.section == 2) {
//        return 200;
//    } else {
//
//
//
//        return 100;
//    }
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell for path: %lu, %lu", indexPath.section, indexPath.row);
    MyCell *characterCell =[tableView dequeueReusableCellWithIdentifier:@"characterCell"];
    
    Character *characterObject = self.characterArray[indexPath.row];
    
    UIImage *photo = [UIImage imageNamed:characterObject.imageName];
    [characterCell.cellImage setImage:photo];
    characterCell.cellLabel.text = characterObject.name;
    
    //1. create custom accessory view
    UIImage * newimage = [UIImage imageNamed:@"lisa.png"];
    
    UIImageView * custom = [[UIImageView alloc] initWithImage:newimage];
    
    //2. set my custom accesory to the cell
    characterCell.accessoryView = custom;
    
    characterCell.backgroundColor = [UIColor purpleColor];
    
    characterCell.accessoryView.backgroundColor = [UIColor yellowColor];
    characterCell.accessoryView.layer.cornerRadius = characterCell.accessoryView.frame.size.width / 2;
    characterCell.accessoryView.layer.masksToBounds = YES;
    
    
    return characterCell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"The Characters";
    
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return @"That's all";
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.lastSelectedRow = indexPath.row;
    return indexPath;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 300, 50);
    
    label.text = @"The Simpsons";
    
    label.backgroundColor = [UIColor yellowColor];
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = [UIFont systemFontOfSize:25.0];
    
    return label;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


-(void)formViewcontroller:(FormViewController *)formVC didcreateCharacter:(Character *)model {
    
    
    //ADD NEW CHARACTER - UPDATING OUR MODEL DATA
    NSMutableArray * mutableCharacters = [self.characterArray mutableCopy];
    
    [mutableCharacters addObject:model];
    
    self.characterArray = [mutableCharacters copy];
    
    
    NSLog(@"TITULO: %@", formVC.title);
    
    //UPDATED THE VIEW
    [self.tableView reloadData];
    
    [self saveCharactersToDisc];
    
    
    
}


-(void)saveCharactersToDisc {
    
    //show and world of is the same thing
    NSMutableArray * convertedShows = [NSMutableArray array];
    
    for (WorldOf *show in self.characterArray)  {
        
        //get the dictionary for this show
        NSDictionary * showDictionary = [show toDictionary];
        
        //add the converted dictionary to convertedshow
        [convertedShows addObject:showDictionary];
    }
    
    //NOW convertedShows CONTAINS ONLY STRING, NUMBERS, ARRAYS AND DICTIONARY
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * documentsDirectory = paths.firstObject;
    //documents directory is something like "/user/carlos/documents/....
        
    NSString * destinationPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    //now tell the array to save
    [convertedShows writeToFile:destinationPath atomically:YES];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"AddSegue"]){
        
        FormViewController * formVC = segue.destinationViewController;
        
        formVC.delegate = self;
        
        
        
    }
    
    
    if ([[segue identifier] isEqualToString:@"detailImage"])
    {
        
        
        DetailsViewController * detailVC =  segue.destinationViewController;
        
        Character *characterObject = self.characterArray[self.lastSelectedRow];
        
        
        detailVC.getPhoto = characterObject.imageName;
        
    } else {
        
        
        
    }
    
    
}



@end
