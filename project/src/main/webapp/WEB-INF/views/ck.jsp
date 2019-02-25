<!DOCTYPE html>
<html lang="ko">
<head>
 <script src="/resources/ckeditor/ckeditor.js"></script>
    <script>
    window.onload = function(){
       ck = CKEDITOR.replace("editor");
    };
    </script>
    
    
    <script src="/resources/components/ckeditor/ckeditor.js"></script>
<script>
    var editorConfig = {
        filebrowserUploadUrl : "/ckEditor/imgUpload", //이미지 업로드
    };

    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;

        switch (dialogName) {
            case 'image': //Image Properties dialog
            //dialogDefinition.removeContents('info');
            dialogDefinition.removeContents('Link');
            dialogDefinition.removeContents('advanced');
            break;
        }
    });
 window.onload = function(){
      ck = CKEDITOR.replace("editor", editorConfig);
 };
</script>

</head>
<body>
    <form>
        <textarea name="editor1" id="editor1" rows="10" cols="80">
            This is my textarea to be replaced with CKEditor.
        </textarea>
        <script>
			CKEDITOR.replace( 'editor1', {
			filebrowserUploadUrl: '/project/board/imageUpload.do'	
		
			});
		</script>
    </form>
    
  
</body>
</html>