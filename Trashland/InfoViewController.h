#import <UIKit/UIKit.h>

@protocol InfoViewControllerDelegate <NSObject>

- (void) askedToDismissInfo;

@end

@interface InfoViewController : UIViewController

@property (nonatomic, assign) id <InfoViewControllerDelegate> delegate;

@end
