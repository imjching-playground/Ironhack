//
//  MyLabel.m
//  CustomClassGestures
//
//  Created by Carlos Butron on 21/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.textColor = [UIColor greenColor];
    self.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.textColor = [UIColor yellowColor];
    self.transform = CGAffineTransformIdentity;
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.backgroundColor = [UIColor blueColor];
    
}



@end
