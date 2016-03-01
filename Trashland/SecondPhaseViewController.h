#import <UIKit/UIKit.h>

@protocol SecondPhaseViewControllerDelegate <NSObject>

- (void) askedToDismissSecondPhase;

@end

@interface SecondPhaseViewController : UIViewController

@property (nonatomic, assign) id <SecondPhaseViewControllerDelegate> delegate;

@end
