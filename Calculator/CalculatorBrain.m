//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Leah Zulas on 6/10/13.
//
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end


@implementation CalculatorBrain
@synthesize programStack = _programStack;

- (NSMutableArray *) programStack
{
    if(_programStack == nil)
    {
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}

/*
- (void)setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}
*/


- (void) pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.programStack addObject: operandObject];
}

/*- (double) popOperand
{
    NSNumber *operandObject = [self.programStack lastObject];
    if (operandObject)
    {
        [self.programStack removeLastObject];
    }
    return [operandObject doubleValue];
}
 */
- (double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}
- (id)program
{
    return [self.programStack copy];
}

+ (NSString *) descriptionOfProgram:(id)program
{
    return @"implementthis in assignment 2";
}

+ (double)popOperandOffStack: (NSMutableArray *)stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]])
    {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topOfStack;
        
        if([operation isEqualToString:@"+"])
        {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        }
        else if ([operation isEqualToString:@"-"])
        {
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
        }
        else if ([operation isEqualToString:@"*"])
        {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        }
        
        else if ([operation isEqualToString:@"/"])
        {
            double divisor = [self popOperandOffStack:stack];
            if (divisor)
            {
                result = [self popOperandOffStack:stack] / divisor;
            }
            else
            {
                result = 0;
            }
        }
        
    }
    return result;
}

+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]])
         {
             stack = [program mutableCopy];
         }
         return [self popOperandOffStack:stack];
}


// makes it easy to figure out whats in your object by typing in po self

- (NSString *) description
{
    return [NSString stringWithFormat: @"stack = %@", self.programStack];
}

@end
