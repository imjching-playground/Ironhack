//
//  LightView.m
//  TrafficLight
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "LightView.h"

@implementation LightView


- (void)awakeFromNib
{
    NSLog(@"awake from nib");
    
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.borderWidth = 5;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowRadius = 8;
    self.layer.shadowOffset = CGSizeMake(20, 20);
}


@end
