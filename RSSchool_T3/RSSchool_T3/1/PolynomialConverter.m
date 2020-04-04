#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    NSMutableString *result = [[NSMutableString alloc] init];
    unsigned long int degree = [numbers count] - 1;
    if ([numbers isEqualToArray:@[]])
        return nil;
    for (NSNumber *counter in numbers) {
        if ([counter intValue] > 1 && degree != 0)
            [result appendFormat:@"%dx", [counter intValue]];
        else if ([counter intValue] < -1 && degree != 0)
            [result appendFormat:@"%dx", -[counter intValue]];
        else if ([counter intValue] == 0) {
            degree--;
            continue;
        }
        else if ([counter intValue] == 1 || [counter intValue] == -1)
            [result appendFormat:@"x"];
        
        if (degree > 1) {
            [result appendFormat:@"^%d", (int)degree];
            degree--;
            if ([[numbers objectAtIndex:([numbers count] - degree - 1)] intValue] >= 0) {
                [result appendString:@" + "];
                continue;
            }
            else {
                [result appendString:@" - "];
                continue;
            }
        }
        else if (degree == 1) {
            degree--;
            if ([[numbers objectAtIndex:([numbers count] - degree - 1)] intValue] > 0) {
                [result appendString:@" + "];
                continue;
            }
            else if ([[numbers objectAtIndex:([numbers count] - degree - 1)] intValue] == 0) {
                return result;
            }
            else {
                [result appendString:@" - "];
                continue;
            }
        }
        else if (degree == 0) {
            [result appendFormat:@"%d", [counter intValue]];
            return result;
        }
    }
    return result;
}
@end
