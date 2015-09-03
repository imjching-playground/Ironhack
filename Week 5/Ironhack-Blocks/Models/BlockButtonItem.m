//
//  BlockButtonItem.m
//  Models
//
//  Created by Joan Romano on 6/1/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import "BlockButtonItem.h"

@interface BlockButtonItem ()

@property (copy,nonatomic) barButtonItemBlock block;

@end

@implementation BlockButtonItem

- (instancetype)initWithTitle:(NSString *)title block:(barButtonItemBlock)block
{
    self = [super initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction:)];
    if (self) {
        _block=block;
    }
    return self;
}

- (void)buttonAction:(id)sender{
    self.block();
}

@end
