//
//  Employee.m
//  TestPerson
//
//  Created by Carlos Butron on 05/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Employee.h"

@implementation Employee


- (instancetype)initWithName:(NSString *)myName
                     surname:(NSString *)mySurname
                          ID:(NSString *)myID
                  employeeID:(NSString *)myEmployeeID{
    
    self = [super initWithName:myName surname:mySurname ID:myID];
    
    if (self){
        
        self.employeeID = myEmployeeID;
        
    }
    
    return self;
    
    
}

- (void) work{
    NSLog(@"I'm working");
}

- (NSString * )description {
    return [NSString stringWithFormat:@"Name: %@ %@, ID: %@", self.name, self.surname, self.ID ];
}

@end
