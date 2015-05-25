//
//  CharactersViewController.m
//  ComplicatedModel
//
//  Created by Georgios Pessios on 5/14/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "CharactersViewController.h"
#import "CharacterModel.h"
#import "GeorgeCell.h"
#import "FormViewController.h"
#import "DetailsViewController.h"

@interface CharactersViewController () <UITableViewDataSource, UITableViewDelegate, DetailsViewControllerDelegate, FormViewControllerDelegate>

@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, strong) NSIndexPath* lastSelectedIndex;

@end

@implementation CharactersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //LOAD ALL CHARACTERS FROM DISC
    self.characters = [CharacterModel allCharacters];
}

#pragma mark - UITableViewDataSource - provide data to the table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GeorgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHARACTER"];
    CharacterModel *oneCharacter = self.characters[indexPath.row];
    cell.nameOfCharacter.text= oneCharacter.name;
    
    UIImage *showImage = [UIImage imageNamed:oneCharacter.image];
    cell.imageOfCharacter.image = showImage;;
    
    return cell;
}

#pragma mark - UITableViewDelegate optional methods implementation

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //STORE WHICH CELL WAS CLICKED to pass to the segue
    self.lastSelectedIndex = [indexPath copy];
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //DESELECT THE CELL WHEN USER TAPS IT
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - FormViewControllerDelegate - methods to add new character

-(void)didCreateCharacter:(CharacterModel *)model
{
    //ADD NEW CHARACTER - UPDATING OUR MODEL DATA
    NSMutableArray* mutableCharacters =
        [self.characters mutableCopy];
    [mutableCharacters addObject: model];
    
    self.characters = [mutableCharacters copy];
    
    //UPDATING THE VIEW
    [self.tableView reloadData];
    
    [self saveCharactersToDisc];
}

-(void)saveCharactersToDisc
{
    NSMutableArray* convertedCharacters =
        [NSMutableArray array];
    
    //TODO: add converting the model to dictionary here
    for (CharacterModel* model in self.characters) {
        NSDictionary* convertedModel =
            [model toDictionary];
        [convertedCharacters addObject: convertedModel];
    }
    
    //NOW convertedShows CONTAINS ONLY STRINGS, NUMBERS,
    //ARRAYS AND DICTIONARY
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
      NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = paths.firstObject;
    // documentsDirectory is smth like "/user/Marin/documents"
    
    NSString *destinationPath = [documentsDirectory
                                 stringByAppendingPathComponent:
                                 @"data.plist"];
    
    //NOW TELL THE ARRAY TO SAVE
    [convertedCharacters writeToFile:destinationPath
                     atomically:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender
{
    // ONE SEGUE SHOWS THE SCREEN TO ADD CHARACTER
    if ([segue.identifier isEqualToString:@"add"]) {

        FormViewController* formVC =
            segue.destinationViewController;
        formVC.delegate = self;
    }
    
    // THIS SEGUE SHOWS THE EDIT SCREEN
    if ([segue.identifier isEqualToString:@"edit"]) {
        DetailsViewController* editVC = segue.destinationViewController;
        editVC.selectedCharacter = self.characters[self.lastSelectedIndex.row];
        editVC.indexPath = self.lastSelectedIndex;
        editVC.delegate = self;
    }
}

#pragma mark - DetailsViewController - methods to edit and delete characters

-(void)didEditCharacter:(CharacterModel*)character withIndex:(NSIndexPath*)indexPath
{
    //RECEIVES AS A PARAMETER THE EDITED CHARACTER MODEL
    NSMutableArray* mutableCharacters = [self.characters mutableCopy];
    mutableCharacters[indexPath.row] = character;
    self.characters = [mutableCharacters copy];
    
    [self.tableView reloadData];
    [self saveCharactersToDisc];
}

-(void)didDeleteCharacterAtIndex:(NSIndexPath*)indexPath
{
    //RECEIVES AS A PARAMETER THE INDEX OF THE CHARACTER TO DELETE
    NSMutableArray* mutableCharacters = [self.characters mutableCopy];
    [mutableCharacters removeObjectAtIndex: indexPath.row];
    self.characters = [mutableCharacters copy];
    
    [self.tableView reloadData];
    [self saveCharactersToDisc];

}

@end
