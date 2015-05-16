//
//  PersonFactory.m
//  TestPerson
//
//  Created by Carlos Butron on 05/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "PersonFactory.h"

@implementation PersonFactory


+ (Person *)createsPersonWithName:(NSString *)name surname:(NSString *)surname idNumber:(NSString *)idNumber{
    
    Person *person = [[Person alloc] initWithName:name surname:surname ID:idNumber];
    
    return person;
   
}

+ (Employee *)createsEmployeeWithName:(NSString *)name surname:(NSString *)surname idNumber:(NSString *)idNumber employeeId:(NSString *)employeeId{
    
    Employee *employee = [[Employee alloc] initWithName:name surname:surname ID:idNumber employeeID:employeeId];
    
    return employee;
    
}

+ (NSString *)interestingIdForPersonOrEmployee: (id)personOrEmployee{
    
    
    if ([personOrEmployee isMemberOfClass:[Employee class]]){
        //if its employee
//        Employee *employee = (Employee *)personOrEmployee;  //this is another way to do the same stuff
//        return employee.employeeID;
        return ((Employee *)personOrEmployee).employeeID;
        
    } else if ([personOrEmployee isMemberOfClass:[Person class]]) {
        //if its a person
        return ((Person *)personOrEmployee).ID;
        
    } else {
        return @"Not a valid ID";
    }

}


+ (NSArray *)arrayWithOnlyPersonsFromArray:(NSArray *)originalArray{
    
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:originalArray];
    
    
    for (id object in originalArray){
        
        if (!([object isMemberOfClass:[Person class]])){
            [result removeObject:object];
        }
        
    }
    
    
    return result;
}

    



@end
