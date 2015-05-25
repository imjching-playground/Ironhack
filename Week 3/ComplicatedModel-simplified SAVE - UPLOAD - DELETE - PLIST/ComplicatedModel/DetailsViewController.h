//
//  DetailsViewController.h
//  ComplicatedModel
//
//  Created by Marin Todorov on 5/20/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterModel.h"

@protocol DetailsViewControllerDelegate <NSObject>
@required
-(void)didEditCharacter:(CharacterModel*)character withIndex:(NSIndexPath*)indexPath;
-(void)didDeleteCharacterAtIndex:(NSIndexPath*)indexPath;
@end


@interface DetailsViewController : UIViewController

@property (weak, nonatomic) CharacterModel* selectedCharacter;
@property (strong, nonatomic) NSIndexPath* indexPath;

@property (weak, nonatomic) id<DetailsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


@end
