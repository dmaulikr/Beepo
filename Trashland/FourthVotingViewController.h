#import <UIKit/UIKit.h>

@protocol FourthVotingViewControllerDelegate <NSObject>

- (void) askedVotingDismiss;

@end

@interface FourthVotingViewController : UIViewController

@property (nonatomic, assign) id <FourthVotingViewControllerDelegate> delegate;

@end
