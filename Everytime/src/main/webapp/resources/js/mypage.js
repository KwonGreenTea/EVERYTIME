		document.addEventListener('DOMContentLoaded', function() {
			document.getElementById('passwordChange').addEventListener('click',
					function(event) {
						event.preventDefault();
						document.getElementById('pwForm').submit();
					});
	
			document.getElementById('emailChange').addEventListener('click',
					function(event) {
						event.preventDefault();
						document.getElementById('emailForm').submit();
					});
	
			document.getElementById('nicknameChange').addEventListener('click',
					function(event) {
						event.preventDefault();
						document.getElementById('nicknameForm').submit();
					});
	
			document.getElementById('inquiryBtn').addEventListener('click',
					function(event) {
						event.preventDefault();
						window.location.href = "inquiry";
					});
	
			document.getElementById('unregisterBtn').addEventListener('click',
					function(event) {
						event.preventDefault();
						window.location.href = "unregister";
					});
		});
	
		// 로그아웃
		function logout() {
			document.getElementById('logoutBtn').submit();
		}
	
		// 모달 열기
		function changeImgModal() {
			document.getElementById('imgModal').style.display = "block";
		}
		
		// 이미지 파일 업로드
		function changeImgBtn() {
			document.getElementById('imgFile').click();
		}
		
		function handleFileSelect(event) {
		    const file = event.target.files[0];
		    if (file) {
		        const allowedExtensions = ['.jpg', '.jpeg', '.png'];
		        const fileExtension = file.name.slice(((file.name.lastIndexOf(".") - 1) >>> 0) + 2).toLowerCase();
		        
		        if (allowedExtensions.includes('.' + fileExtension)) {
		            let maxSize = 5 * 1024 * 1024; // 5 MB 
		            if (file.size < maxSize) {
		                const reader = new FileReader();
		                reader.onload = function(e) {
		                    const imgPreview = document.getElementById('imgPreview');
		                    imgPreview.innerHTML = `<img src="${e.target.result}">`;
		                    document.getElementById('changeImgBtn').style.display = 'none';
		                    document.getElementById('reImgBtn').style.display = 'inline-block';
		                    document.getElementById('uploadBtn').style.display = 'inline-block';
		                };
		                reader.readAsDataURL(file);
		            } else {
		                alert("파일 크기가 너무 큽니다. 최대 크기는 5MB입니다.");
		                document.getElementById('imgFile').value = '';
		                document.getElementById('imgPreview').innerHTML = '';
		                document.getElementById('uploadBtn').style.display = 'none';
		                document.getElementById('reImgBtn').style.display = 'none';
		                document.getElementById('changeImgBtn').style.display = 'inline-block';
		            }
		        } else {
		            alert('허용되지 않는 파일 형식입니다.');
		            document.getElementById('imgFile').value = '';
		            document.getElementById('imgPreview').innerHTML = '';
		            document.getElementById('uploadBtn').style.display = 'none';
		            document.getElementById('reImgBtn').style.display = 'none';
		            document.getElementById('changeImgBtn').style.display = 'inline-block';
		        }
		    }
		}
		
		function uploadFile() {
		    const fileInput = document.getElementById('imgFile');
		    const file = fileInput.files[0];
		    if (file) {
		        const formData = new FormData();
		        formData.append('imgFile', file);
		
			       $.ajax({
		            url: 'imgUpload',  
		            type: 'POST',
		            data: formData,
		            processData: false,  
		            contentType: false,  
		            success: function(result) {
		            	document.getElementById('attachForm').submit();
		                
		                alert("프로필 이미지 변경 성공!");
		                document.getElementById('uploadBtn').style.display = 'none';
		                document.getElementById('reImgBtn').style.display = 'none';
		                document.getElementById('changeImgBtn').style.display = 'inline-block';
		                document.getElementById('imgFile').value = '';
		                document.getElementById('imgPreview').innerHTML = '';
		            },
		            error: function(xhr, status, error) {
		                 alert("프로필 이미지 변경 실패.");
		            }
		        });
		    }
		}

		// 모달 창 외부 클릭 시 닫기
		window.onclick = function(event) {
			if (event.target == document.getElementById('imgModal')) {
				document.getElementById('imgModal').style.display = "none";
			}
		}