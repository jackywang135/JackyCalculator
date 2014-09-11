//
//  Calculator.h
//  Calculator2
//
//  Created by JackyWang on 9/10/14.
//  Copyright (c) 2014 JackyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property(nonatomic, strong) NSDecimalNumber *num;
@property(nonatomic, strong) NSString *operator;
-(NSDecimalNumber*)calculate:(NSDecimalNumber*)number;

@end

@interface Calculator ()
@property(nonatomic) BOOL ifLastOperationWasEqual;
-(void)clearMemory;
@end
