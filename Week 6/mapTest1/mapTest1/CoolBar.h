//
//  CoolBar.h
//  mapTest1
//
//  Created by Leo Font on 6/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

typedef enum {
    classic_bar = 0,
    tapas_bar = 1,
    piano_bar = 2,
    discoteque = 3
} BAR_TYPE;

@interface CoolBar : NSObject <MKAnnotation>

@property (nonatomic) BAR_TYPE type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) CLLocationCoordinate2D coordinate;


@end
