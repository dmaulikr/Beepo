#import <UIKit/UIKit.h>

@protocol ThirdPhaseViewControllerDelegate <NSObject>

- (void) askedToDismissThirdPhase;

@end

@interface ThirdPhaseViewController : UIViewController

@property (nonatomic, assign) id <ThirdPhaseViewControllerDelegate> delegate;

@end
