//
//  ViewController.m
//  TestPerson
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Employee.h"
#import "PersonFactory.h"
#import "NSDictionary+CreatePerson.h"


@interface ViewController ()

//private

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Person *person = [[Person alloc] initWithName:@"Carlos"];
    //Person * person = [[Person alloc] init];
    
    //person.name = @"Javi";
    
    
    person = [self changeName:person];
    
    Employee *employee = [[Employee alloc] initWithName:@"Anakin" surname:@"Skywalker" ID:@"JEDI" employeeID:@"BLACK"];
    
    NSLog(@"%@", [employee employeeID]);
    
    

    
    NSLog(@"%@", person.name);
    
    
    
    
    Person *pFact = [PersonFactory createsPersonWithName:@"Javi" surname:@"WhatEver" idNumber:@"1111"];
    Employee *eFact = [PersonFactory createsEmployeeWithName:@"Javi" surname:@"WhatEver" idNumber:@"2222" employeeId:@"3333"];
    
    NSMutableArray *emptyArrayForNow = [NSMutableArray array];
    
    for (int i=0; i<10; i++){
        Person *p = [[Person alloc] initWithName:@"Anakin" surname:@"Skywalker" ID:[NSString stringWithFormat:@"%d",i]];
        [emptyArrayForNow addObject:p];
    }
    
    //empty array for ow have 10 persons inside
    
    for (Person *p in emptyArrayForNow){
        NSLog(@"Person ID is %@", p.ID);
    }
    
    
    
    //find person class
    NSArray *gazpacho = @[person, person, @"Not a person", @2, [NSArray array]];
    
    
    NSArray *onlyPerson = [PersonFactory arrayWithOnlyPersonsFromArray:gazpacho];
    
    for (Person *p in onlyPerson){
        NSLog(@"Person name: %@",  p.name);
    }
    
    
    
    NSLog(@"ID: %@", [PersonFactory interestingIdForPersonOrEmployee:pFact]);
    NSLog(@"ID: %@", [PersonFactory interestingIdForPersonOrEmployee:eFact]);
    
    
    BOOL responds = [employee respondsToSelector:@selector(work)];
    NSLog(@"respond employee: %d", responds);
    
    responds = [person respondsToSelector:@selector(work)];
    NSLog(@"respond person: %d", responds);
    
    BOOL isKind = [employee isKindOfClass:[Person class]];
    if (isKind){
        NSLog(@"YES");
    }
    
    
    
    
    //NSDictionary
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"name", @"Manolo", @"surname", @"Garcia", nil];
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    [mutableDict setObject:@"111" forKey:@"ID"];
    [mutableDict removeObjectForKey:@"ID"];
    [mutableDict removeAllObjects];
    
    NSArray *values = [dict allValues];
    NSArray *keys = [dict allKeys];
    
    
    //nsdictionary with plist
    
    NSDictionary *dictFromFile = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"plist"]];
    
    
    
    Person *personFromFile = [dictFromFile personFromDataDictionary];
    NSLog(@"the name of a person is %@", personFromFile.name);
    
    
    
    NSArray *theArrayOfDictionariesOfPersons = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"array" ofType:@"plist"]];
    
    NSArray *theFinalArrayToPrint = [self theArrayOfPeopleFromDicts:theArrayOfDictionariesOfPersons];
    
    
    for (Person *print in theFinalArrayToPrint){
        
        NSLog(@"My name is: %@\nMy surname is: %@\nMy ID is: %@", print.name, print.surname, print.ID);
    }
    
    //[[theFinalArrayToPrint lastObject] printDescription];
    
    
    
    NSMutableString *muString = [NSMutableString stringWithString:@"hello"];
    NSLog(@"%@", muString);
    
    int number = 1;
    
  //  [muString appendString:(@" %d", number)];
    
    NSMutableArray *mutArray = [NSMutableArray array];
    [mutArray addObject:@"Hello"];
    [mutArray addObject:[NSDate date]];
    [mutArray addObject:@1];
    
    NSNumber *number1 = @1;
    
    NSInteger *numberNormal = [number1 integerValue];
    float numberFloat = [number1 floatValue];
    
    
    
    //NSDATE
    
    NSDate *today = [NSDate date];
    NSLog(@"date: %@", today);
    
    NSTimeInterval unixDate = [today timeIntervalSince1970];
    
    NSLog(@"Date: %f", unixDate);
    
    //NSSET
    
    NSSet *set = [NSSet setWithObjects:@"one", @"two", nil];
    
    NSString *anyObject = [set anyObject];
    NSArray *arrayOfObjects = [set allObjects];
    
    NSLog(@"%@", anyObject);
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

 //to chek that data in Person is not null




- (Person *)changeName:(Person *)person{
    
    [person setName:@"John"];
    
    return person;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *)theArrayOfPeopleFromDicts:(NSArray *)originalArray {
    
    NSMutableArray *theArrayOfPersons = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eachDictionary in originalArray){
        
        Person *eachPerson = [[Person alloc]initWithName:eachDictionary[@"Name"] surname:eachDictionary[@"Surname"]  ID:eachDictionary[@"ID"]];
        
        
        [theArrayOfPersons addObject:eachPerson];
        
    }
    
        
    return theArrayOfPersons;
    
}




#pragma mark - ChangeName Protocol Methods

- (void)didChangeName:(NSString *)newName{
    
    NSLog(@"Did change name! %@", newName);
    
}






@end
