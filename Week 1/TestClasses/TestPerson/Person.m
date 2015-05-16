//
//  Person.m
//  TestPerson
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Person.h"


@interface Person()

@property (nonatomic, strong) UIImage *privateImage;

@end


@implementation Person

@synthesize name;
@synthesize delegate;




- (instancetype)initWithName:(NSString *)myName {
    

    
    self = [self initWithName:myName surname:@"essribe tu apellido" ID:@""];
    
    return self;
    
}



- (instancetype)initWithName:(NSString *)myName
                     surname:(NSString *)mySurname
                          ID:(NSString *)myID {

    self = [super init];
    
    if (self) {
        name = myName;
        self.surname = mySurname;
        self.ID = myID;
    }
    
    return self;

}




- (void)printDescription{
    NSLog(@"My name is %@", name);
}


- (void) setName:(NSString *)myName{
    
    name= myName;
    
    
    [delegate didChangeName:myName];
    
}


#pragma mark - UIImage stuff

- (UIImage *)image{
    
    if (self.privateImage == nil){
        
        self.privateImage = [UIImage imageNamed:@"default"];
    }
    
    
    
    return self.privateImage;
}

//- (NSString *)description{
//    return [NSString stringWithFormat:@"Person with name: ]
//}

@end
