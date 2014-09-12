//
//  Calculator.m
//  Calculator2
//
//  Created by JackyWang on 9/10/14.
//  Copyright (c) 2014 JackyWang. All rights reserved.
//

#import "Calculator.h"
#import <objc/message.h>

@implementation Calculator

- (NSDecimalNumber*)calculate:(NSDecimalNumber*)a
{
    if(a) {
    NSDictionary *operatorStringSelectorMap = @{
       @"+": @"decimalNumberByAdding:",
       @"-": @"decimalNumberBySubtracting:",
       @"x": @"decimalNumberByMultiplyingBy:",
       @"÷": @"decimalNumberByDividingBy:"};
    NSString *selectorString = operatorStringSelectorMap[self.operator];
    if (selectorString) {
        return [self.num performSelector:NSSelectorFromString(selectorString) withObject:a];
    }
    }
    return nil;
}

-(void)clearMemory
{
    self.num=nil;
    self.operator=nil;
    self.ifLastOperationWasEqual=NO;
    
}

@end
