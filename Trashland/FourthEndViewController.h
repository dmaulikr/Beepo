#import <UIKit/UIKit.h>

@protocol FourthEndViewControllerDelegate <NSObject>

@end

@interface FourthEndViewController : UIViewController

@property (nonatomic, assign) id <FourthEndViewControllerDelegate> delegate;

@end
