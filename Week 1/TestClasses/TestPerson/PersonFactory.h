//
//  PersonFactory.h
//  TestPerson
//
//  Created by Carlos Butron on 05/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"

@interface PersonFactory : NSObject


+ (Person *)createsPersonWithName:(NSString *)name surname:(NSString *)surname idNumber:(NSString *)idNumber;

+ (Employee *)createsEmployeeWithName:(NSString *)name surname:(NSString *)surname idNumber:(NSString *)idNumber employeeId:(NSString *)employeeId;

+ (NSString *)interestingIdForPersonOrEmployee: (id)personOrEmployee;

+ (NSArray *)arrayWithOnlyPersonsFromArray:(NSArray *)originalArray;



@end
