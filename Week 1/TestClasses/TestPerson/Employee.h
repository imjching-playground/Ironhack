//
//  Employee.h
//  TestPerson
//
//  Created by Carlos Butron on 05/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Person.h"

@interface Employee : Person

@property (nonatomic, strong) NSString *employeeID;

- (instancetype)initWithName:(NSString *)myName
                     surname:(NSString *)mySurname
                          ID:(NSString *)myID
                  employeeID:(NSString *)myEmployeeID;

- (void)work;



@end
