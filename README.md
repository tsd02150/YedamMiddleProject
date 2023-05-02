## 개발환경
- Eclipse
- Oracle
- Github
- Open API


## 사용기술
  * JAVA 11
  * Maven

  
* Database
  * Oracle
  
* FrontEnd
  * JavaScript
  * html
  * css


## 팀 소개
- [김도현](https://github.com/dohyun5) - 마이페이지(공지사항, 주문내역, 배송현황, 장바구니, 위시리스트, 매출현황)
- [김미향](https://github.com/kmhyang) - 제품 상세페이지, 리뷰, 상품문의, 업체정보, 구매장통계
- [김수인](https://github.com/ksuin22) - 테마 기획전 페이지, 고객센터 페이지
- [신재영](https://github.com/tsd02150) - 메인페이지, 핫딜, FaQ, 회원가입, 로그인

## 발표자료
[발표자료 다운로드]

<br/>
<br/>
<hr>
<br/>

## Eclipse 환경에서 Github 연동하는 과정입니다.
  - 반드시 개인 브랜치에서 작업 후 merge한다.
  - 브랜치명은 각자의 이름으로한다
  - push전 main branch pull은 필수로 이행한다.
  - 별도의 Pakage 추가 시 즉시 psuh & 알려준다.
  
## 1. Local에 Repository Clone
1. (Eclipse Git Repositories) : git에서 code<> 클릭 > https url 복사 > Git Repositories 의 [Clone a git repository and add the clone to this view] 선택 > Clone되는 경로기억  
 
  
## 예시 (환경마다 다를 수 있음)
![image](https://user-images.githubusercontent.com/85140469/235565232-e89355ad-cc69-417f-84a0-439ded2bb3c2.png)


## 3. 개인 Branch 생성 및 이용방법
만들어진 레파지토리 우클릭 > 현재는 main으로 되어있음 > switch to > new branch > Branch name 작성
  
## 4. 개인 Branch에서 자유롭게(?) 작업한 후에 push하는 과정
1.
올리기 전에 main branch에 내용 pull
pull... 클릭
![image](https://user-images.githubusercontent.com/85140469/235565671-328d60fb-96a9-4ce7-a45e-4996c397fc58.png)
Reference 에 main 입력 후 main[branch]선택
Finish

2.
프로젝트 우클릭 Team Share > push branch '본인 브랜치'
![image](https://user-images.githubusercontent.com/85140469/235566029-924fb414-e207-43a1-9ede-3d9a039fd533.png)

  
## 5. 마무리로 master branch에 병합
1.
혹시 모르니 한번 더 main branch에 내용 pull
pull... 클릭
![image](https://user-images.githubusercontent.com/85140469/235565671-328d60fb-96a9-4ce7-a45e-4996c397fc58.png)
Reference 에 main 입력 후 main[branch]선택
Finish

2.
git Repositories 가서 switch to로 main 브랜치로 이동
![image](https://user-images.githubusercontent.com/85140469/235566227-46d3db56-ea94-4959-9cd8-20ea116a970d.png)
우클릭 해서 merge 선택
origin/"본인브랜치" 선택
merge 완료 후
다시 우클릭 push branch 'main'
