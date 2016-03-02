#import <UIKit/UIKit.h>

@protocol FourthStoryViewControllerDelegate <NSObject>

@end

@interface FourthStoryViewController : UIViewController

@property (nonatomic, assign) id <FourthStoryViewControllerDelegate> delegate;

@end
