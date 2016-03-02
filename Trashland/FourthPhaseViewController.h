#import <UIKit/UIKit.h>

@protocol FourthPhaseViewControllerDelegate <NSObject>

- (void) askedToDismiss;

@end

@interface FourthPhaseViewController : UIViewController

@property (nonatomic, assign) id <FourthPhaseViewControllerDelegate> delegate;

@end
