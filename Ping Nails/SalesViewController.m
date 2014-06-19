//
//  SalesViewController.m
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "ReservationViewController.h"
#import "ReportsViewController.h"
#import "AdminViewController.h"
#import "LogoutViewController.h"

#import "SalesViewController.h"
@interface SalesViewController ()
{
    //left tableview cells purpose except giftcard
    NSMutableArray *_leftTableIndexArr,*_leftTableNameOfSerObjArr,*_leftTablepriceOfSerObjArr;
    //left tableview giftcard cells purpose
    NSMutableArray *productObjectsArray;
    NSMutableArray *_QuantityArray;
    //giftcard cell purpose
    NSMutableArray *customcellArray,*NameOfServiceObj;
}
@end
AppDelegate *appd;
@implementation SalesViewController
@synthesize collectionViewPack,leftTable,Total,subTotal,giftCard,doller,finalizeOrderTable,imgviewSubtotal,imgviewTotal,subtotalheading,totahHeading,giftcareHeading,orderHeading,labelLineHead,finalizeOrderBtn,okbtn,cancelbtn,finalTotal,SubView,selectedIndexPathsArr,selectedIndexPathsArr2,selectedIndexPathsArr3,selectedIndexPathsArr4,selectedIndexPathsArr5,leftBgView,employeeIconArray;
static NSString * const kCellReuseIdentifier = @"collectionViewCell";
static NSString * const kCellReuseIdentifier2 = @"collectionViewCell2";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    actionSheet.delegate = self;
    [self.leftTable registerNib:[UINib nibWithNibName:@"leftTableCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.leftTable registerNib:[UINib nibWithNibName:@"leftTableCell2" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    [self.finalizeOrderTable registerNib:[UINib nibWithNibName:@"orderpannelCell" bundle:nil] forCellReuseIdentifier:@"Cell3"];
    
    
    //giftcard purpose
    giftcardNo=0,giftcardValue=0;
   //textfield edit delete mode
    textfieldEditDeletValue=10000;
  //  textfieldEditTagValMore=20000;
    abc=0;bcd=0;cde=0;
    textfieldValueArr=[[NSMutableArray alloc] initWithCapacity:40];
    for (int cnt=0; cnt<=39; cnt++)
    {
        [textfieldValueArr addObject:@""];
    }
    
  //tickmark images arrays
    
    nailSerSeletedArr=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"Basic Manicure_checked.png"],[UIImage imageNamed:@"Landmark Manicure_checked.png"],[UIImage imageNamed:@"Deluxe Manicure_checked.png"],[UIImage imageNamed:@"Spa Pedicure_checked.png"],[UIImage imageNamed:@"Landmark Pedicure_checked.png"],[UIImage imageNamed:@"Deluxe Pedicure_checked.png"], nil];
 
    maniSerSelectedArr=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"Spa Combo_checked.png"],[UIImage imageNamed:@"Landmark Combo_checked.png"],[UIImage imageNamed:@"Deluxe Combo_checked.png"], nil];
    
    nailEnhanceSerSeletedArr=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"Acrylic_checked.png"],[UIImage imageNamed:@"Regular Tip_checked.png"],[UIImage imageNamed:@"White & Color Tip_checked.png"],[UIImage imageNamed:@"Pink Powder_checked.png"],[UIImage imageNamed:@"Glitter Powder_checked.png"],[UIImage imageNamed:@"Sea Shell_checked.png"],[UIImage imageNamed:@"Gel Powder_checked.png"], nil];
    kidServicesSelectedArr=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"Basic Manicure1_checked.png"],[UIImage imageNamed:@"Spa Pedicure1_checked.png"],[UIImage imageNamed:@"Spa Combo1_checked.png"],[UIImage imageNamed:@"Polish Change_checked.png"], nil];
    additionalSerSelectedArr=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"check.png"], nil];
 
    // textfield tagArry & employee icon
    
    empTagIndex=0;
    
    textfielTagArr=[NSMutableArray arrayWithCapacity:36];
    employeeIconArray =[[NSMutableArray alloc]initWithCapacity:36];
    for (int i = 0; i < 35; i++)
    {//employeeIconArray
        [textfielTagArr addObject:@""];
        [employeeIconArray addObject:[NSNumber numberWithBool:NO]];
    }
    
    selectedIndexPathsArr = [NSMutableArray arrayWithCapacity:6];
    for (int i = 0; i < 6; i++)
    {
        [selectedIndexPathsArr addObject:[NSNumber numberWithBool:NO]];
    }
    selectedIndexPathsArr2=[NSMutableArray arrayWithCapacity:3];
    giftcardTextfieldValue=[NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 3; i++)
    {
        //giftcard
        [giftcardTextfieldValue addObject:@""];
        [selectedIndexPathsArr2 addObject:[NSNumber numberWithBool:NO]];
        
    }
    selectedIndexPathsArr3=[NSMutableArray arrayWithCapacity:7];
    for (int i = 0; i < 7; i++)
    {
        [selectedIndexPathsArr3 addObject:[NSNumber numberWithBool:NO]];
    }
    selectedIndexPathsArr4=[NSMutableArray arrayWithCapacity:4];
    for (int i = 0; i < 4; i++)
    {
        [selectedIndexPathsArr4 addObject:[NSNumber numberWithBool:NO]];
    }
    selectedIndexPathsArr5=[NSMutableArray arrayWithCapacity:15];
    for (int i = 0; i < 15; i++)
    {
        [selectedIndexPathsArr5 addObject:[NSNumber numberWithBool:NO]];
    }
    // storing subtotal
    subTotalArr=[NSMutableArray new];
    subTotalDisplay=0;
     tempString=[NSMutableString new];
    //DB accessing..
     dbAccess = [[DBAccess alloc] init];
    
    //finalize order table
    okbtn.layer.cornerRadius=20;
    cancelbtn.layer.cornerRadius=20;
    finalTotal.layer.cornerRadius=20;
    finalizeOrderTable.layer.cornerRadius=50;
    SubView.layer.cornerRadius=30;
    [SubView setHidden:YES];
    //appdelegate
     appd=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    //view background//Viewbg.png  && subview background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"myScreen Shot 2014-06-08 at 5.09.05 pm.png"]];
    self.SubView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"finalizeOrderbg.png"]];
    //suppllementaryView
    [self.collectionViewPack registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
   
    // bill caluculation purpose
 
    //gift card temporary static value purpos
  
    [giftCard setTag:3000];
   
      giftCard.text=[NSMutableString stringWithFormat:@""];
    
    comparestr=@"Gift Card Purchase";
    string$=@"$";
    leftTableString$=@"-$";
    [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier];
    
    [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem2" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier2];
    // collectionView background color
    self.collectionViewPack.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gray.png"]];
    
    //collectionView flowlayout
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
   
    //edge size ie before,after,between,....
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 30, 15);
    
    //collectionView scrolling dierction
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionViewPack setCollectionViewLayout:flowLayout];
    
    [self.collectionViewPack setAllowsSelection:YES];
    
    self.collectionViewPack.delegate=self;
    self.collectionViewPack.dataSource=self;//Basic Manicure.jpg
    finalizeOrderBtn.layer.cornerRadius=10;
 }
// collection view data source methods ////////////////////////////////////
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //productArr = [dbAccess getAllProductsbyCategory:(section+1)];
    Categorys *category = [categoryArr objectAtIndex:section];
    productArr = [dbAccess getAllProductsbyCategory:category.categoryid];
    
    //Check once agin...
//    if([category.name isEqualToString:@"Nails spa"]){
//        nailsArray = productArr;
//    }
    return productArr.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    categoryArr = [dbAccess getAllCategories];
    return categoryArr.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.section==4)
        {
            return CGSizeMake(146, 50);
        }
        else return CGSizeMake(146, 158);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    serviceNameOfCollctionCell = (UILabel *)[cell viewWithTag:100];
    servicePriceOfCollctionCell = (UILabel *)[cell viewWithTag:200];
    servieImage = (UIImageView *)[cell viewWithTag:300];
    cellBottomImgView=(UIImageView *)[cell viewWithTag:900];
    if (indexPath.section==4)
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier2 forIndexPath:indexPath];
        serviceNameOfCollctionCellAddSer = (UILabel *)[cell viewWithTag:400];
        servicePriceOfCollctionCellAddSer = (UILabel *)[cell viewWithTag:500];
        servieImageForAdditionalSer=(UIImageView *)[cell viewWithTag:800];
       
        productArr2 = [dbAccess getAllProductsbyCategory:(indexPath.section+1)];
        
        
//#########here doing get fail
       // productArr2 = [dbAccess getAllProductsbyCategory:(productArr.count)];
        
        
        pro = [productArr2 objectAtIndex:indexPath.row];

        serviceNameOfCollctionCellAddSer.text=pro.name;
        
        if (indexPath.row==14)
        {
            servicePriceOfCollctionCellAddSer.text=@"Enter Amt";
        }
        else
        {
        servicePriceOfCollctionCellAddSer.text=[string$ stringByAppendingString:[NSMutableString stringWithFormat:@"%0.1f",pro.price]];
        }
        
        NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr5 objectAtIndex:indexPath.row];
        if (flag1 == [NSNumber numberWithBool:NO])
        {
            //unchecked image
            servieImageForAdditionalSer.image=[UIImage imageNamed:@"Screen.png"];
        }else
        {
            //index 0 value okay
            servieImageForAdditionalSer.image=[additionalSerSelectedArr objectAtIndex:0];
        }
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-cell.png"]]];
        return cell;
    }
    else
    {
        productArr2 = [dbAccess getAllProductsbyCategory:(indexPath.section+1)];
        pro2 = [productArr2 objectAtIndex:indexPath.row];
            serviceNameOfCollctionCell.text = pro2.name;
      
            servicePriceOfCollctionCell.text =[string$ stringByAppendingString:[NSMutableString stringWithFormat:@"%0.1f",pro2.price]];
        
            if (indexPath.section==0)
            {
                   NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr objectAtIndex:indexPath.row];
                   if (flag1 == [NSNumber numberWithBool:NO])
                    {
                       servieImage.image=[UIImage imageNamed:pro2.imageName];
                        cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBg.png"];
                     }else
                     {
                        //Check once....
                        // NSString *withoutExt =[pro2.imageName substringToIndex:[pro2.imageName rangeOfString:@"."].location];
                         //basicManicure.png---> basicManicure_checked.png
                         //NSString *checkedImg = [NSString stringWithFormat:@"%@_checked.png",withoutExt];
                         //imagee.image=[UIImage imageNamed:checkedImg];
                        
                         
                         
                      cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBgRed.png"];
                      
                         
                         
                         servieImage.image=[nailSerSeletedArr objectAtIndex:indexPath.row];
                      //  servieImage.image=[UIImage imageNamed:pro2.selectedImageName];
                     }

            }else if(indexPath.section==1)
            {
                NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr2 objectAtIndex:indexPath.row];
                
                if (flag1 == [NSNumber numberWithBool:NO])
                {
                    servieImage.image=[UIImage imageNamed:pro2.imageName];
                     cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBg.png"];
                }else
                {
                    servieImage.image=[maniSerSelectedArr objectAtIndex:indexPath.row];
                    cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBgRed.png"];

                   // servieImage.image=[UIImage imageNamed:pro2.selectedImageName];
                }
            }
            else if(indexPath.section==2)
            {
                NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr3 objectAtIndex:indexPath.row];
                if (flag1 == [NSNumber numberWithBool:NO])
                {
                    cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBg.png"];

                    servieImage.image=[UIImage imageNamed:pro2.imageName];
                }else
                {
                    cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBgRed.png"];

                    servieImage.image=[nailEnhanceSerSeletedArr objectAtIndex:indexPath.row];
                   // servieImage.image=[UIImage imageNamed:pro2.selectedImageName];
                }
            }
            else if(indexPath.section==3)
            {
                NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr4 objectAtIndex:indexPath.row];
                if (flag1 == [NSNumber numberWithBool:NO])
                {
                    cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBg.png"];

                    servieImage.image=[UIImage imageNamed:pro2.imageName];
                }else
                {
                    
                    cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBgRed.png"];

                    servieImage.image=[kidServicesSelectedArr objectAtIndex:indexPath.row];
                   // servieImage.image=[UIImage imageNamed:pro2.selectedImageName];
                }
            }
       return cell;
    }
    
    return nil;
}
#pragma mark - delegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
 //   [self.leftTable reloadData];
    [self.collectionViewPack reloadData];

    productArr2 = [dbAccess getAllProductsbyCategory:(indexPath.section+1)];
    pro2=[productArr2 objectAtIndex:indexPath.row];
    appd.dataName=[NSMutableString stringWithFormat:@"%@",pro2.name];
    appd.dataPrice=[NSMutableString stringWithFormat:@"%f",pro2.price];
    appd.dataSection=[NSMutableString stringWithFormat:@"%d",indexPath.section];
    appd.dataRow=[NSMutableString stringWithFormat:@"%d",indexPath.row];
    
    //calculation purpose
    int sum=0; NSMutableString *tempPrice=[NSMutableString new];

    if (indexPath.section==4)
    {
        if ([comparestr isEqualToString:appd.dataName])
        {
            if ([customcellArray containsObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]])
            {
                //remove cell
                [customcellArray removeObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
                // remove service name
                [NameOfServiceObj removeObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
                
                // remove barcode , giftcardvalue
                [giftcardTextfieldValue replaceObjectAtIndex:0 withObject:@""];
                [giftcardTextfieldValue replaceObjectAtIndex:1 withObject:@""];
               
                Total.text=[NSMutableString stringWithFormat:@"%d",(subTotalDisplay-giftcardValue)];
subTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay-giftcardValue)-prepurchasedValue)];
finalTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay-giftcardValue)-prepurchasedValue)];
  
            }else
            {
                [self createCellForLeftTableGiftCard];
            }
        }
        else
        {
            if([_leftTableIndexArr containsObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]])
            {
                
                NSUInteger index2 = [_leftTableNameOfSerObjArr indexOfObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
                
                //   NSLog(@"%d",index);
                
                [textfielTagArr removeObjectAtIndex:index2];
                [textfielTagArr addObject:@""];
                [textfieldValueArr removeObjectAtIndex:index2];
                [textfieldValueArr addObject:@""];
                [employeeIconArray removeObjectAtIndex:index2];
                [employeeIconArray addObject:[NSNumber numberWithBool:NO]];
                
                
                
                
                //cell deletion
                 [_leftTableIndexArr removeObjectAtIndex:index2];
                //name of service deletion
                [_leftTableNameOfSerObjArr removeObjectAtIndex:index2];
                //name of price deletion
                 [_leftTablepriceOfSerObjArr removeObjectAtIndex:index2];
                
                for (int con=0; con<_leftTablepriceOfSerObjArr.count; con++)
                {
                    NSString *qnttt=[textfieldValueArr objectAtIndex:con];
                    
                    tempPrice=[_leftTablepriceOfSerObjArr objectAtIndex:con];
                    
                    int cost=[tempPrice intValue];
                    
                    sum=sum+([qnttt intValue]*cost);
                }
                
                subTotalDisplay=sum;
                Total.text=[NSMutableString stringWithFormat:@"%d",(subTotalDisplay+giftcardValue)];
subTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay+giftcardValue)-prepurchasedValue)];
finalTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay+giftcardValue)-prepurchasedValue)];
                
            }else
            {
               // [textfielTagArr addObject:@""];
                [self createCellForLeftTable];
            }
        }

        NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr5 objectAtIndex:indexPath.row];
        if (flag1 == [NSNumber numberWithBool:NO])
        {
            [selectedIndexPathsArr5 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
        }else
            [selectedIndexPathsArr5 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        
    }
    else
    {
      if([_leftTableIndexArr containsObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]])
      {
          NSUInteger index = [_leftTableNameOfSerObjArr indexOfObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
          
        [textfielTagArr removeObjectAtIndex:index];
        [textfielTagArr addObject:@""];
        [textfieldValueArr removeObjectAtIndex:index];
        [textfieldValueArr addObject:@""];
        [employeeIconArray removeObjectAtIndex:index];
        [employeeIconArray addObject:[NSNumber numberWithBool:NO]];
          //textfield edit delete mode
          textfieldEditDeletValue=index;
          
          
          if (textfieldEditTagValMore>index)
          {
              abc=1000;
          }else if (textfieldEditTagValMore<index)
          {
              bcd=1000;
          }else if (textfieldEditTagValMore==index)
          {
              cde=1000;
          }
          
        //cell deletion
          [_leftTableIndexArr removeObjectAtIndex:index];
        //name of service deletion
          [_leftTableNameOfSerObjArr removeObjectAtIndex:index];
        //name of price deletion
          [_leftTablepriceOfSerObjArr removeObjectAtIndex:index];
          
          // image code original image
          
          //here do work
          
          for (int con=0; con<_leftTablepriceOfSerObjArr.count; con++)
          {
              NSString *tempQuantity=[textfieldValueArr objectAtIndex:con];
              
              tempPrice=[_leftTablepriceOfSerObjArr objectAtIndex:con];//
              
              int cost=[tempPrice intValue];
            
              sum=sum+([tempQuantity intValue]*cost);
          }
          subTotalDisplay=sum;
          Total.text=[NSMutableString stringWithFormat:@"%d",(subTotalDisplay+giftcardValue)];
subTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay+giftcardValue)-prepurchasedValue)];
          finalTotal.text=[NSMutableString stringWithFormat:@"%d",(subTotalDisplay+giftcardValue)];
      }
     else
      {
        [self createCellForLeftTable];
      }
        
        if (indexPath.section==0)
        {
            NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr objectAtIndex:indexPath.row];
            if (flag1 == [NSNumber numberWithBool:NO])
            {
                [selectedIndexPathsArr replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
            }else
             [selectedIndexPathsArr replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        }
        else if (indexPath.section==1)
        {
            NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr2 objectAtIndex:indexPath.row];
            if (flag1 == [NSNumber numberWithBool:NO])
            {
                [selectedIndexPathsArr2 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
            }else
                [selectedIndexPathsArr2 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        }
       else if (indexPath.section==2)
        {
            NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr3 objectAtIndex:indexPath.row];
            if (flag1 == [NSNumber numberWithBool:NO])
            {
                [selectedIndexPathsArr3 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
            }else
                [selectedIndexPathsArr3 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        }
       else if (indexPath.section==3)
        {
            NSNumber *flag1 = (NSNumber *)[selectedIndexPathsArr4 objectAtIndex:indexPath.row];
            if (flag1 == [NSNumber numberWithBool:NO])
            {
                [selectedIndexPathsArr4 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
            }else
                [selectedIndexPathsArr4 replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        }

}
[self.collectionViewPack reloadData];
[self.leftTable reloadData];
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//highlight & dehighlight a cell
- (void)collectionView:(UICollectionView *)colView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
   UICollectionViewCell *cell = [collectionViewPack cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor blueColor];
}
- (void)collectionView:(UICollectionView *)colView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionViewPack cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}
//supplementary view fr header purpose//////////////////////////////////
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    SupplementaryView *supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SupplementaryView" forIndexPath:indexPath];
    
    if(kind == UICollectionElementKindSectionHeader)
    {
        supplementaryView.backgroundColor = [UIColor lightGrayColor];
        Categorys *cat = [categoryArr objectAtIndex:indexPath.section];
        supplementaryView.label.text=cat.name;
    }
  return supplementaryView;
}
//header for collection view size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(528, 50);
}
// statusBar hidden purpose
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
//cell creation
-(void)createCellForLeftTable
{
// here is the change fr cell deleation & insertion in the leftTableView;
    if (!_leftTableIndexArr)
    {
        _leftTableIndexArr = [NSMutableArray new];
        _leftTableNameOfSerObjArr = [NSMutableArray new];
        _leftTablepriceOfSerObjArr = [NSMutableArray new];
        [_leftTableIndexArr addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
        [_leftTableNameOfSerObjArr addObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
        [_leftTablepriceOfSerObjArr addObject:[NSMutableString stringWithFormat:@"%@",appd.dataPrice]];
    }else
    {
    [_leftTableIndexArr addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
    [_leftTableNameOfSerObjArr addObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
    [_leftTablepriceOfSerObjArr addObject:[NSMutableString stringWithFormat:@"%@",appd.dataPrice]];
    }
}
-(void)createCellForLeftTableGiftCard
{
    if (!customcellArray)
    {
    customcellArray = [NSMutableArray new];
    NameOfServiceObj = [NSMutableArray new];
    [customcellArray addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
    [NameOfServiceObj addObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
    }else
    {
    [customcellArray addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
    [NameOfServiceObj addObject:[NSMutableString stringWithFormat:@"%@",appd.dataName]];
    }
}
//leftTableview methods////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    return [customcellArray count];
    else
    return _leftTableIndexArr.count;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    static NSString *cellIdentifier2=@"Cell2";
    //orderpannel popup 
    static NSString *cellIdentifier3=@"Cell3";
    if (tableView==finalizeOrderTable)
    {
        // finalize order pannel purpose
        orderpannelCell *cell=(orderpannelCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier3];
        if (cell==nil)
        {
        cell=[[orderpannelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
        }
        if (indexPath.section==0)
        {//giftcard purpose
            cell.servName.text=[NameOfServiceObj objectAtIndex:indexPath.row];
            cell.Qntity.text=[giftcardTextfieldValue objectAtIndex:0];

            cell.price.text=[giftcardTextfieldValue objectAtIndex:1];
           
            return cell;
        }
        else
        {//remainng cells purpose
            cell.servName.text=[_leftTableNameOfSerObjArr objectAtIndex:indexPath.row];
            //cell.Qntity.text=@"quantity";
            [cell.Qntity setText:[textfieldValueArr objectAtIndex:indexPath.row]];
            
            NSString *tempPricestr= [_leftTablepriceOfSerObjArr objectAtIndex:indexPath.row];
            NSString *priceSub=[tempPricestr substringWithRange: NSMakeRange (0, 2)];
            cell.price.text=[leftTableString$ stringByAppendingString:priceSub];
            return cell;
        }
    }
    else
    {// left table purpose
    if (indexPath.section==0)
    {//giftcard purpose do the giftcard functionality
        leftTableCell2 *cell = (leftTableCell2 *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (cell==nil)
        {
           cell=[[leftTableCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
        }
        cell.Barcode.delegate=self;
        cell.Quantity2.delegate=self;
        cell.Barcode.tag=2000;
        cell.Quantity2.tag=1000;
        cell.Quantity2.text=[giftcardTextfieldValue objectAtIndex:0];
        cell.Barcode.text=[giftcardTextfieldValue objectAtIndex:1];
        cell.NameOfTheservice2.text=[NameOfServiceObj objectAtIndex:indexPath.row];
        return cell;
    }
    else if (indexPath.section==1)
    {
        leftTableCell *cell = (leftTableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell==nil)
        {
            cell=[[leftTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.Quantity.tag=indexPath.row;
        cell.empbtn.tag=indexPath.row;
        cell.Quantity.delegate=self;
        cell.NameofServices.text=[_leftTableNameOfSerObjArr objectAtIndex:indexPath.row];
     
        NSString *tempPricestr= [_leftTablepriceOfSerObjArr objectAtIndex:indexPath.row];
        NSString *priceSub=[tempPricestr substringWithRange: NSMakeRange (0, 2)];
       
        cell.Price.text=[leftTableString$ stringByAppendingString:priceSub];
       [cell.Quantity setText:[textfieldValueArr objectAtIndex:indexPath.row]];
        
        //employee
        [cell.empbtn addTarget:self action:@selector(employeeIcon:) forControlEvents:UIControlEventTouchUpInside];

        NSNumber *flag1 = (NSNumber *)[employeeIconArray objectAtIndex:indexPath.row];
        if (flag1 == [NSNumber numberWithBool:NO])
        {
            cell.empbtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"unselecteduser.png"]];//selecteduser.png
        }else
        {
            cell.empbtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"selecteduser.png"]];
        }
        
        return cell;
    }
}
return nil;
}
// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag==3000)
    {
        if (_leftTableIndexArr.count==0)
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"please select services" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
            giftCard.text=nil;
            [alert show];
        }
       else if ([textField.text intValue]>(subTotalDisplay+giftcardValue))
        {
            UIAlertView *alertgif=[[UIAlertView alloc] initWithTitle:@"hello" message:@"please enter correct value ie less than or equal to total bill" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
            
            [alertgif show];
            giftCard.text=nil;
        }
        else
        {
             prepurchasedValue=[giftCard.text intValue];
        }
    }
   else if (textField.tag==1000|| textField.tag==2000)
    {
        if (textField.tag==1000)
        {
            giftcardNo=[textField.text intValue];
            [giftcardTextfieldValue replaceObjectAtIndex:0 withObject:[NSMutableString stringWithFormat:@"%d",giftcardNo]];
        }
        else
        {
            giftcardValue=[textField.text intValue];
            [giftcardTextfieldValue replaceObjectAtIndex:1 withObject:[NSMutableString stringWithFormat:@"%d",giftcardValue]];
        }
    }
    else
    {
       if ([textfielTagArr containsObject:[NSMutableString stringWithFormat:@"%d",textField.tag]])
       {
        NSMutableString *tempQuantityStr=[textfieldValueArr objectAtIndex:textField.tag];
        
        int quantityValue=[tempQuantityStr integerValue];
        
        NSMutableString *tempPrice=[_leftTablepriceOfSerObjArr objectAtIndex:textField.tag];
        
        int priceValue=[tempPrice intValue];
        
        int amount=quantityValue * priceValue;
        
        subTotalDisplay=subTotalDisplay-amount;
      }
    [textfielTagArr replaceObjectAtIndex:textField.tag withObject:[NSMutableString stringWithFormat:@"%d",textField.tag]];
    [textfieldValueArr replaceObjectAtIndex:textField.tag withObject:textField.text];
    //quantity
    int qnt=[textField.text intValue];
    //price
        
        if (cde==1000)//equal
        {
        //        int i=textField.tag;
        //        j=_leftTablepriceOfSerObjArr.count;
        tempString=0;
        [textfieldValueArr removeObjectAtIndex:textField.tag];
        [textfieldValueArr addObject:@""];
            cde=10;
        }
        else if (abc==1000)//greterthan
        {
            tempString=[_leftTablepriceOfSerObjArr objectAtIndex:textField.tag];;
            [textfieldValueArr replaceObjectAtIndex:textField.tag withObject:textField.text];
            abc=10;
        }
        else if (bcd==1000)//lessthan
        {
            tempString=[_leftTablepriceOfSerObjArr objectAtIndex:textField.tag];
            [textfieldValueArr replaceObjectAtIndex:textField.tag withObject:textField.text];
            bcd=10;
        }
        else
        {
             tempString=[_leftTablepriceOfSerObjArr objectAtIndex:textField.tag];
        }
//    if(_leftTablepriceOfSerObjArr.count==0||[textfieldValueArr objectAtIndex:textField.tag]==[ NSMutableString stringWithString:@""])
//    {
//       tempString=[NSMutableString stringWithString:@""];
//        [textfieldValueArr removeObjectAtIndex:textField.tag];
//        [textfieldValueArr addObject:@""];
//    }else
//    {
      
        
//        NSLog(@"%d",textField.tag);
//        int i=textField.tag;
//        int j=i;
//        j=_leftTablepriceOfSerObjArr.count;
//        if (textfieldEditDeletValue==textField.tag )
//        {
//            tempString=0;
//            [textfieldValueArr removeObjectAtIndex:textField.tag];
//            [textfieldValueArr addObject:@""];
//            textfieldEditDeletValue=10000;
//        }else
//        {
//            NSLog(@"%d",textField.tag);
//            int i=textField.tag;
//            int j=i;
//            if (textfieldEditTagValMore==20000)
//            {
//                /// do caluculation
//            }else
//            {
//             tempString=[_leftTablepriceOfSerObjArr objectAtIndex:textField.tag];
//            }
//        }
 

//     }
    int pricee=[tempString intValue];
   
    //subtotal & total
    int subTotalPrice=(qnt*pricee);
    
    subTotalDisplay=subTotalDisplay+subTotalPrice;
   
    }
    
    Total.text=[NSMutableString stringWithFormat:@"%d",(subTotalDisplay+giftcardValue)];
    
subTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay+giftcardValue)-prepurchasedValue)];
    
finalTotal.text=[NSMutableString stringWithFormat:@"%d",((subTotalDisplay+giftcardValue)-prepurchasedValue)];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
      textfieldEditTagValMore=textField.tag;
    
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    //textField.text=nil;
    if ([textField.text isEqualToString:@""]||textField.text==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"please enter quantity" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
        [alert show];
    }else
    {
    [textField resignFirstResponder];
    }
    return YES;// this method return time called santhu
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    /* for backspace */
    if([string length]==0){
        return YES;
    }
    /*  limit to only numeric characters  */
      NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++) {
        unichar ch = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:ch]) {
            return YES;
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"please enter numaric characters" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
           [alert show];
        }
    }
    return NO;
}
//display the total
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)okayAction:(id)sender
{
    UIAlertView *alertx=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"Order is success" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alertx show];
    for (int i = 0; i < 35; i++)
    {
        [textfielTagArr replaceObjectAtIndex:i withObject:@""];
        [employeeIconArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
    for (int cn=0; cn<=38; cn++)
    {
        [textfieldValueArr replaceObjectAtIndex:cn withObject:@""];
    }
    for (int i = 0; i < 6; i++)
    {
        [selectedIndexPathsArr replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
    for (int i = 0; i < 3; i++)
    {
        [giftcardTextfieldValue replaceObjectAtIndex:i withObject:@""];
        [selectedIndexPathsArr2 replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
    for (int i = 0; i < 7; i++)
    {
        [selectedIndexPathsArr3 replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
    for (int i = 0; i < 4; i++)
    {
        [selectedIndexPathsArr4 replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
    for (int i = 0; i < 15; i++)
    {
        [selectedIndexPathsArr5 replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
    }
    
    [collectionViewPack reloadData];
    subTotalDisplay=0;
    Total.text=0;
    subTotal.text=0;
    finalTotal.text=0;
    giftCard.text=nil;
    giftcardNo=0;
    giftcardValue=0;
    
    prepurchasedValue=0;
    [customcellArray removeAllObjects];
    [NameOfServiceObj removeAllObjects];
    [customcellArray removeAllObjects];
    [_leftTableIndexArr removeAllObjects];
    [_leftTableNameOfSerObjArr removeAllObjects];
    [_leftTablepriceOfSerObjArr removeAllObjects];
    
    [self.leftTable reloadData];
    
    [self.SubView setHidden:YES];
    [collectionViewPack setHidden:NO];
    [leftTable setHidden:NO];
    [Total setHidden:NO];
    [giftCard setHidden:NO];
    [subTotal setHidden:NO];
    [imgviewTotal setHidden:NO];
    [imgviewSubtotal setHidden:NO];
    [subtotalheading setHidden:NO];
    [totahHeading setHidden:NO];
    [giftcareHeading setHidden:NO];
    [orderHeading setHidden:NO];
    [labelLineHead setHidden:NO];
    [finalizeOrderBtn setHidden:NO];
}
- (IBAction)cancelAction:(id)sender
{
    [self.SubView setHidden:YES];
    [doller setHidden:NO];
    [collectionViewPack setHidden:NO];
    [leftTable setHidden:NO];
    [Total setHidden:NO];
    [giftCard setHidden:NO];
    [subTotal setHidden:NO];
    [imgviewTotal setHidden:NO];
    [imgviewSubtotal setHidden:NO];
    [subtotalheading setHidden:NO];
    [totahHeading setHidden:NO];
    [giftcareHeading setHidden:NO];
    [orderHeading setHidden:NO];
    [labelLineHead setHidden:NO];
    [finalizeOrderBtn setHidden:NO];
}
- (IBAction)FinalizeOrder:(id)sender
{
    if (_leftTableIndexArr.count==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"please select services" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
        [alert show];
    }else
    {
    int validation=0;
    for (int z=0; z<_leftTableIndexArr.count; z++)
    {
        if ([[textfieldValueArr objectAtIndex:z]isEqualToString:@""])
        {
            validation=1;
        }
    }
    if (validation==1)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"please enter quantity" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
        [alert show];
    }else if ([giftCard.text isEqualToString:@""])
    {
        NSLog(@"%@",giftCard.text);
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"HELLO" message:@"please enter giftcard value" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
        [alert show];
    }
    else{
    [finalizeOrderTable reloadData];
        [doller setHidden:YES];
    [self.SubView setHidden:NO];
     [leftBgView setHidden:YES];
    [collectionViewPack setHidden:YES];
    [leftTable setHidden:YES];
    [Total setHidden:YES];
    [giftCard setHidden:YES];
    [subTotal setHidden:YES];
    [imgviewTotal setHidden:YES];
    [imgviewSubtotal setHidden:YES];
    [subtotalheading setHidden:YES];
    [totahHeading setHidden:YES];
    [giftcareHeading setHidden:YES];
    [orderHeading setHidden:YES];
    [labelLineHead setHidden:YES];
    [finalizeOrderBtn setHidden:YES];
    }
    }
}
-(void)employeeIcon:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    NSNumber *flag1 = (NSNumber *)[employeeIconArray objectAtIndex:senderButton.tag];
    if (flag1 == [NSNumber numberWithBool:NO])
    {
        dbAccess = [[DBAccess alloc] init];
        employeesArr2 = [dbAccess getAllEmpDetails];
        
        array1=[[NSMutableArray alloc]init];
        
        for(int counter =0; counter < employeesArr2.count; counter++)
        {
            Employee *emp = [employeesArr2 objectAtIndex:counter];
            [array1 addObject:[NSMutableString stringWithFormat:@"%@",emp.name]];
        }
        actionSheet = [[UIActionSheet alloc] init];
        actionSheet.title = @"Employee Name";
        
        actionSheet.delegate = self;
        
        for(int i=0;i<[array1 count];i++)
        {
            [actionSheet addButtonWithTitle:[array1 objectAtIndex:i]];
        }
         [actionSheet showInView:self.view];
       
        [employeeIconArray replaceObjectAtIndex:senderButton.tag withObject:[NSNumber numberWithBool:YES]];
    }
    else
    {
        [employeeIconArray replaceObjectAtIndex:senderButton.tag withObject:[NSNumber numberWithBool:NO]];
        [self.leftTable reloadData];
    }
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
        [self.leftTable reloadData];
    }
}
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    [[actionSheet layer] setBackgroundColor:[UIColor blackColor].CGColor];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Inside didSelectRowAtIndexPath");
}
@end
