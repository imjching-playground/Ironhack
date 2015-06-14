//
//  CoolBarList.m
//  mapTest1
//
//  Created by Leo Font on 6/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "CoolBarList.h"
#import "CoolBar.h"

@implementation CoolBarList

+ (NSArray *)allCoolBarsFromPlist{
    
    NSArray *coolBarsFromFile = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CoolBarList" ofType:@"plist"]];
    
    NSMutableArray *coolBars = [[NSMutableArray alloc]initWithCapacity:coolBarsFromFile.count];
    
    for (NSDictionary *barDict in coolBarsFromFile) {
        
        CoolBar *bar = [[CoolBar alloc] init];
        bar.name = [barDict valueForKey:@"name"];
        
        CLLocationCoordinate2D coord;
        coord.latitude = [barDict[@"latitude"] floatValue];
        coord.longitude = [barDict[@"longitude"] floatValue];
        
        bar.coordinate = coord;

        bar.type = [barDict[@"type"]intValue];;
                    
        [coolBars addObject:bar];
    }
    
    return [coolBars copy];
   
}

@end
