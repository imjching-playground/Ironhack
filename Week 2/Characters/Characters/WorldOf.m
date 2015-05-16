//
//  WorldOf.m
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "WorldOf.h"
#import "Character.h"

@implementation WorldOf




- (instancetype)initWithName:(NSString *)worldOfName
                   imageName:(NSString *)worldOfImageName
                   characters:(NSArray  *)worldOfCharacters{
    
    
    self = [self init];
    
    if (self) {
        
        self.name = worldOfName;
        self.imageName = worldOfImageName;
        
        NSMutableArray *arrayOfCharacters = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in worldOfCharacters) {
            Character *character = [[Character alloc]initWithName:dictionary[@"name"] imageName:dictionary[@"imageName"]];
            [arrayOfCharacters addObject:character];
        }
        
        self.characters = arrayOfCharacters;
        
    }
    
    return self;
    
}


+ (NSArray *)setArrayWithWorldAndCharacters {
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * documentsDirectory = paths.firstObject;
    //documents directory is something like "/user/carlos/documents/....
    
    NSString * sourcePath = [[NSBundle mainBundle] pathForResource:@"character" ofType:@"plist"];
    
    NSString * destinationPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    // destination path is "/user/carlos/documents/data.plist"
    
    if ([fileManager fileExistsAtPath:destinationPath]==NO) {
        //NO FILE IN DOCUMENTS -> copy it to the bundle
        [fileManager copyItemAtPath:sourcePath
                             toPath:destinationPath
                              error:nil];
        
    }
    
    
    
    
    //init the result array
    NSMutableArray *theArrayWithWorldAndCharacters = [[NSMutableArray alloc] init];
    
    //get the plist
    NSArray *arraywithThePlist = [NSArray arrayWithContentsOfFile:destinationPath];
    
    
    //set the result array
    for (NSDictionary *eachDictionary in arraywithThePlist){
        
        
        WorldOf *worldOf = [[WorldOf alloc] initWithName:eachDictionary[@"name"] imageName:eachDictionary[@"imageName"] characters:eachDictionary[@"characters"]];
        
        [theArrayWithWorldAndCharacters addObject:worldOf];
        
    }
    
    
    return theArrayWithWorldAndCharacters;
    
}



- (NSDictionary *)toDictionary {
    
    
    //CREATE NEW LIST OF CHARACTERS
    NSMutableArray * characters = [NSMutableArray array];
    
    //GRAB EACH CHARACTER MODEL
    for (Character *character in self.characters) {
        
        //GET DICTIONARY FOR EACH MODEL
        NSDictionary * characterDictionary = [character toDictionary];
        
        //ADD THE DICTIONARY TO THE LIST
        [characters addObject:characterDictionary];
        
    }
    
    //HERE characters CONTAINS ALL CHARACTERS IN FORM
    //OF DICTIONARY
    return @{
             @"name": self.name,
             @"imageName": self.imageName,
             @"characters": characters
             };
    
}



@end
