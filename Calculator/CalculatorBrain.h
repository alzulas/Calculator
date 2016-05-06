//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Leah Zulas on 6/10/13.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) pushOperand:(double)operand;
- (double)performOperation:(NSString *)operations;

@property (readonly) id program;

+ (double)runProgram:(id)program;
+ (NSString *) descriptionOfProgram: (id)program;


@end
