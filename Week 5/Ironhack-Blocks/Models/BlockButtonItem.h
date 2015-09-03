//
//  BlockButtonItem.h
//  Models
//
//  Created by Joan Romano on 6/1/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^barButtonItemBlock)();

@interface BlockButtonItem : UIBarButtonItem

- (instancetype)initWithTitle:(NSString *)title block:(barButtonItemBlock)block;

@end
