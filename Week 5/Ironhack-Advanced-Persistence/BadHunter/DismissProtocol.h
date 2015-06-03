//
//  DismissProtocol.h
//  BadHunter
//
//  Created by Carlos Butron on 03/06/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#ifndef BadHunter_DismissProtocol_h
#define BadHunter_DismissProtocol_h


// Protocol definition starts here
@protocol DismissProtocolDelegate <NSObject>

@required

- (void) processDismiss:(BOOL)modifiedData;

@end
// Protocol Definition ends here







#endif
