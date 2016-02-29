#import <UIKit/UIKit.h>

@interface UIView (Blink)

- (void)blinkWithDuration:(NSTimeInterval)duration
                    speed:(NSTimeInterval)speed
          completionBlock:(void (^)(void))completionBlock;

@end