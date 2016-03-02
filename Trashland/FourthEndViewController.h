#import <UIKit/UIKit.h>

@protocol FourthEndViewControllerDelegate <NSObject>

- (void) askedToDismissEnd;

@end

@interface FourthEndViewController : UIViewController

@property (nonatomic, assign) id <FourthEndViewControllerDelegate> delegate;

@end
