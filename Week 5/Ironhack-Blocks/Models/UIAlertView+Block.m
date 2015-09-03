//
//  UIAlertView+Block.m
//  Models
//
//  Created by Joan Romano on 6/1/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import "UIAlertView+Block.h"

#import <objc/runtime.h>

static char DISMISS_IDENTIFER;
static char CANCEL_IDENTIFER;

@implementation UIAlertView (Block)

@dynamic cancelBlock;
@dynamic dismissBlock;

- (void)setDismissBlock:(DismissBlock)dismissBlock
{
    objc_setAssociatedObject(self, &DISMISS_IDENTIFER, dismissBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DismissBlock)dismissBlock
{
    return objc_getAssociatedObject(self, &DISMISS_IDENTIFER);
}

- (void)setCancelBlock:(CancelBlock)cancelBlock
{
    objc_setAssociatedObject(self, &CANCEL_IDENTIFER, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CancelBlock)cancelBlock
{
    return objc_getAssociatedObject(self, &CANCEL_IDENTIFER);
}


+ (UIAlertView*)alertViewWithTitle:(NSString*)title message:(NSString*) message cancelButtonTitle:(NSString*)cancelButtonTitle otherButtonTitles:(NSArray*)otherButtons onDismiss:(DismissBlock) dismissed onCancel:(CancelBlock) cancelled
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:[self class] cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    alert.dismissBlock = dismissed;
    alert.cancelBlock = cancelled;
    
    for(NSString *buttonTitle in otherButtons)
    {
        [alert addButtonWithTitle:buttonTitle];
    }
    
    return alert;
}


+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    
    if(buttonIndex == [alertView cancelButtonIndex])
    {
        if (alertView.cancelBlock)
        {
            alertView.cancelBlock();
        }
    }
    else
    {
        if (alertView.dismissBlock)
        {
            alertView.dismissBlock(buttonIndex - 1); // cancel button is button 0
        }
    }
}

@end
