//
//  AgentEditViewControllerDelegate.h
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AgentEditViewController;

@protocol AgentEditViewControllerDelegate <NSObject>

- (void) dismissAgentEditViewController:(AgentEditViewController *)agentEditVC
                           modifiedData:(BOOL)modifiedData;

@end
