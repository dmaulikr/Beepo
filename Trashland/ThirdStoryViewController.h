#import <UIKit/UIKit.h>

@protocol ThirdStoryViewControllerDelegate <NSObject>

- (void) askedToDismissThirdStory;

@end

@interface ThirdStoryViewController : UIViewController

@property (nonatomic, assign) id <ThirdStoryViewControllerDelegate> delegate;

@end
