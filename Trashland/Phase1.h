#import <UIKit/UIKit.h>

@protocol Phase1Delegate <NSObject>

- (void) askedToDismiss;

@end

@interface Phase1 : UIViewController

@property (nonatomic, assign) id <Phase1Delegate> delegate;

@end
