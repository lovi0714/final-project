/* 아이디 검사 */
   function btnLogin()
   {
           var form = document.loginForm;

                  // 아이디에서 입력 필수 조건문
                  if (form.empId.value == "")
                  {
                          alert("아이디를 입력해주세요.");
                          form.empId.focus(); //포커스를 account박스로 이동.
                          return;
                  }

                  //아이디 입력 문자수를 ~자로 제한하는 조건문

                  if (form.empId.value.length < 4 || form.empId.value.length > 12)
                  {
                   alert("아이디는 4~12자 이내로 입력해주세요.");

                   form.empId.select(); //입력한 문자를 선택 상태로 만듬.
                   return;
                  }

            //입력된 문자의 길이만큼 루프를 돌면서 검사 

            for (i=0; i<form.empId.value.length; i++)
            {
                   var ch = form.empId.value.charAt(i); //문자를 반환(정수형), 범위 검사 가능

                   //입력된 문자를 검사

                   if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) )
                   {
                    alert("아이디는 소문자만 입력해주세요.");
                    form.empId.select();
                    return;
                   }
            }

                    

/* 비밀번호 검사 */
            if (form.password.value == "")
            {
                 alert("비밀번호를 입력해주세요.");
                 form.password.focus(); //포커스를 Password박스로 이동.
                 return;
            }

 

            if (form.password.value.length < 4 || form.password.value.length > 12)
            {
                 alert("비밀번호는 ~자 이내로 입력 가능 합니다!");

                 form.password.select();
                 return;
            }

   form.submit();
   }
//-->
