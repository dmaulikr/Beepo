#import <UIKit/UIKit.h>
#import "Player.h"

@interface Story2 : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgFantasminha;
@property (weak, nonatomic) IBOutlet UIImageView *imgSombra;
@property (weak, nonatomic) IBOutlet UIView *moveBeepoView;
@property (retain,nonatomic) Player* player;

@end
