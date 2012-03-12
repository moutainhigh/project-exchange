

/*
ImgD      Í¼Æ¬ID
ImgWidth  Í¼Æ¬¿í¶È
ImgHeight Í¼Æ¬¸ß¶È
*/
function DrawImage(ImgD,ImgWidth,ImgHeight){
     var image=new Image();
     image.src=ImgD.src;
     if(image.width>0 && image.height>0){
         if(image.width/image.height>= ImgWidth/ImgHeight){
             if(image.width>ImgWidth){
                 ImgD.width=ImgWidth;
                 ImgD.height=(image.height*ImgWidth)/image.width;
             }else{
                 ImgD.width=image.width;
                ImgD.height=image.height;
             }
         } else{
             if(image.height>ImgHeight){
                 ImgD.height=ImgHeight;
                 ImgD.width=(image.width*ImgHeight)/image.height;
             }else{
                 ImgD.width=image.width;
                 ImgD.height=image.height;
             }
        }
     }
 }


