#import "Combinator.h"

@implementation Math : NSObject
+ (long double)Factorial:(int)number {
    if (number == 0)
        return 1;
    return number * [Math Factorial:number - 1];
}
@end

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    for (int counter = 1; counter < [[array objectAtIndex:1] intValue]; counter++) {
        if ([Math Factorial:([[array objectAtIndex:1] intValue])]/ ([Math Factorial:([[array objectAtIndex:1] intValue] - counter)] * [Math Factorial:(counter)]) == [[array objectAtIndex:0] intValue])
            return [NSNumber numberWithInt:counter];
    }
    return nil;
}
@end
