//
//  ViewController.h
//  Calculator2
//
//  Created by JackyWang on 9/9/14.
//  Copyright (c) 2014 JackyWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutletCollection(UIButton) NSArray *buttonNum;
@property (nonatomic, weak) IBOutletCollection(UIButton) NSArray *buttonOperate;

@property (nonatomic, weak) IBOutlet UILabel *labelDisplay;
@property (nonatomic, strong)Calculator *calculator;

//@property (nonatomic, strong)NSDecimalNumber *number;
//@property (nonatomic, strong)NSString *stringDisplay;
//@property (nonatomic, strong)NSString *Operator;


@end

