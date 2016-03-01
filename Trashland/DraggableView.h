#import <UIKit/UIKit.h>

@interface DraggableView : UIView

@property (weak, nonatomic) UIImageView* charImgView;
@property (weak, nonatomic) UIViewController* delegate;
@property (nonatomic, assign) BOOL allowHorizontalAxisMovement;
@property (nonatomic, assign) BOOL allowVerticalAxisMovement;

@end
