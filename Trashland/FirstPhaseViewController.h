#import <UIKit/UIKit.h>

@protocol FirstPhaseViewControllerDelegate <NSObject>

- (void) askedToDismiss;

@end

@interface FirstPhaseViewController : UIViewController

@property (nonatomic, assign) id <FirstPhaseViewControllerDelegate> delegate;

@end
