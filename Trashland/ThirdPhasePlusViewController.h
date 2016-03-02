#import <UIKit/UIKit.h>

@protocol ThirdPhasePlusViewControllerDelegate <NSObject>

- (void)askedToDismissThirdPhasePlus;

@end

@interface ThirdPhasePlusViewController : UIViewController

@property (nonatomic, assign) id <ThirdPhasePlusViewControllerDelegate> delegate;

@end
