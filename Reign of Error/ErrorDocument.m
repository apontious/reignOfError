//
//  ErrorDocument.m
//  Reign of Error
//
//  Created by Andrew Pontious on 7/21/12.
//  Copyright (c) 2012 Andrew Pontious. All rights reserved.
//

#import "ErrorDocument.h"

@interface ErrorDocument ()

@property (strong, nonatomic) NSError *referencedError;

@end

@implementation ErrorDocument

@synthesize referencedError = _referencedError;

- (BOOL)loadFromContents:(NSData *)contents ofType:(NSString *)typeName error:(NSError **)outError {
    BOOL result = NO;
    
    if (outError != nil) {
        *outError = [NSError errorWithDomain:@"DONTPANICDomain"
                                        code:0
                                    userInfo:nil];
    
        //self.referencedError = *outError;
    }
    
    return result;
}


@end
