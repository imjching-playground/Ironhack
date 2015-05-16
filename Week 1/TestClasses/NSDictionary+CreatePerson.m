//
//  NSDictionary+CreatePerson.m
//  TestPerson
//
//  Created by Carlos Butron on 05/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Constants.h"

@implementation NSDictionary (CreatePerson)

- (Person *)personFromDataDictionary {
    
    NSString *name = self[kKeyForName];
    NSString *surname = self[kKeyForSurname];
    NSString *ID = self[kKeyForID];
    
    Person *p = [[Person alloc] init];
    
    if (name != nil) {
        p.name = name;
    }
    
    if (name != nil) {
        p.surname = surname;
    }
    
    if (name != nil) {
        p.ID = ID;
    }
    
    return p;
    
}

@end
