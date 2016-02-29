#import <UIKit/UIKit.h>

@protocol ParentsViewControllerDelegate <NSObject>
- (void) askedToDismiss;
@end

@interface ParentsViewController : UIViewController
@property (nonatomic, weak) id <ParentsViewControllerDelegate> delegate;

@end
