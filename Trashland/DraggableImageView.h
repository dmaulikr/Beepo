#import <UIKit/UIKit.h>

@interface DraggableImageView : UIImageView <UIDynamicItem>

@property   (weak,nonatomic) UIViewController* delegate;
@property (nonatomic) BOOL podeX;
@property (nonatomic) BOOL podeY;
-(void) morre;
@end
