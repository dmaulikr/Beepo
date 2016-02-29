#import <UIKit/UIKit.h>
#import "Player.h"

@interface Phase4 : UIViewController

@property (nonatomic) Player* player;
@property (nonatomic) IBOutlet UIButton* botaoDoacao;
@property (nonatomic) IBOutlet UIButton* botaoEleicao;
@property (weak, nonatomic) IBOutlet UIImageView *badgeDoacaoImgView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeEleicaoImgView;

@end
