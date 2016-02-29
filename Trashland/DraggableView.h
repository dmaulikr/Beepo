#import <UIKit/UIKit.h>

@interface DraggableView : UIView

@property (weak, nonatomic) UIImageView* charImgView;
@property (weak,nonatomic) UIViewController* delegate;
@property (nonatomic) BOOL podeX;
@property (nonatomic) BOOL podeY;
-(void)morre;

@end
